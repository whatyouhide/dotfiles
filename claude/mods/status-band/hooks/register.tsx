import { atom, read, update } from 'claude-code'
import type { EngineInterface, Register } from 'claude-code'

import type { Git, Limit, Usage, Where } from '../types'

const usage = atom({ plugin: 'status-band', key: 'usage' } as const, null)
const git = atom({ plugin: 'status-band', key: 'git' } as const, null)
const where = atom({ plugin: 'status-band', key: 'where' } as const, null)
const effort = atom({ plugin: 'status-band', key: 'effort' } as const, null)

// `claude-opus-4-5-20251101` reads as `Opus 4.5`; an alias (`opus`) as `Opus`.
const modelName = (id: string) => {
  const [, family = id, version] = /^(?:claude-)?([a-z]+)(?:-([\d-]+?))?(?:-\d{8})?(\[.*\])?$/.exec(id) ?? []
  const suffix = /\[.*\]$/.exec(id)?.[0] ?? ''
  const name = family.charAt(0).toUpperCase() + family.slice(1)

  return `${name}${version === undefined ? '' : ` ${version.replaceAll('-', '.')}`}${suffix}`
}

const refreshWhere = async ($: EngineInterface) => {
  const [cwd, home, model] = await Promise.all([
    $.session.cwd(),
    $.env.get('HOME'),
    $.session.model(),
  ])
  const short = home && cwd.startsWith(home) ? `~${cwd.slice(home.length)}` : cwd
  const found: Where = { cwd: short, model: modelName(model) }
  const shown = await read($, where)

  if (shown?.cwd !== found.cwd || shown.model !== found.model) {
    await update($, where, () => found)
  }
}

const refreshGit = async ($: EngineInterface) => {
  let found: Git | null = null

  try {
    const head = await $.process.run(['git', 'symbolic-ref', '--short', '-q', 'HEAD'])
    const sha =
      head.exitCode === 0 ? head : await $.process.run(['git', 'rev-parse', '--short', 'HEAD'])

    if (sha.exitCode === 0) {
      const stat = await $.process.run(['git', 'diff', '--shortstat', 'HEAD'])
      const added = /(\d+) insertion/.exec(stat.stdout)?.[1] ?? '0'
      const deleted = /(\d+) deletion/.exec(stat.stdout)?.[1] ?? '0'
      found = { branch: sha.stdout.trim(), added: Number(added), deleted: Number(deleted) }
    }
  } catch {
    found = null
  }

  await update($, git, () => found)
}

const refreshUsage = async ($: EngineInterface) => {
  const { context, rateLimits, cost } = await $.session.usage()
  const found: Usage = { ...context, limits: rateLimits, usd: cost?.usd }
  await update($, usage, () => found)
}

// The engine draws the band's `[-]` collapse control over its top right.
const COLLAPSE_CELLS = 4

const GREEN = '#4ade80'
const AMBER = '#fbbf24'
const RED = '#f87171'
const TRACK = '#88888855'

const levelColor = (percent: number) => (percent >= 85 ? RED : percent >= 60 ? AMBER : GREEN)

const clamp = (percent: number) => Math.min(100, Math.max(0, percent))

const timeLeft = (limit: Limit | undefined, now: number) => {
  const ms = limit?.resetsAt === undefined ? NaN : Date.parse(limit.resetsAt) - now

  if (Number.isNaN(ms) || ms <= 0) {
    return undefined
  }

  const hours = Math.floor(ms / 3_600_000)
  const minutes = Math.floor((ms % 3_600_000) / 60_000)

  return hours >= 24 ? `${Math.floor(hours / 24)}d${hours % 24}h` : `${hours}h${minutes}m`
}

const tokens = (count: number) =>
  count >= 1_000_000 ? `${(count / 1_000_000).toFixed(1)}M` : `${Math.round(count / 1000)}k`

const ring = (percent: number) => {
  const around = 2 * Math.PI * 7
  const arc = (clamp(percent) / 100) * around

  return (
    '<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">' +
    `<circle cx="9" cy="9" r="7" fill="none" stroke="${TRACK}" stroke-width="2.5"/>` +
    `<circle cx="9" cy="9" r="7" fill="none" stroke="${levelColor(percent)}" stroke-width="2.5" ` +
    `stroke-linecap="round" stroke-dasharray="${arc.toFixed(2)} ${around.toFixed(2)}" ` +
    'transform="rotate(-90 9 9)"/></svg>'
  )
}

const METER_WIDTH = 132

const meterStops = (percent: number) =>
  percent >= 85 ? [RED, '#fca5a5'] : percent >= 60 ? [AMBER, '#fcd34d'] : [GREEN, '#86efac']

// The context meter: a pill in the level color, a little lighter at its tip.
const meter = (percent: number) => {
  const inner = METER_WIDTH - 2
  const fill = percent <= 0 ? 0 : Math.max(8, (clamp(percent) / 100) * inner)
  const [from, to] = meterStops(percent)

  return (
    `<svg xmlns="http://www.w3.org/2000/svg" width="${METER_WIDTH}" height="18" viewBox="0 0 ${METER_WIDTH} 18">` +
    `<defs><linearGradient id="fill" x1="0" x2="1" y1="0" y2="0"><stop offset="0" stop-color="${from}"/>` +
    `<stop offset="1" stop-color="${to}"/></linearGradient></defs>` +
    `<rect x="1" y="5" width="${inner}" height="8" rx="4" fill="${TRACK}"/>` +
    `<rect x="1" y="5" width="${fill.toFixed(1)}" height="8" rx="4" fill="url(#fill)"/>` +
    '</svg>'
  )
}

const COIN =
  '<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">' +
  `<circle cx="9" cy="9" r="7.5" fill="${GREEN}" fill-opacity="0.16" stroke="${GREEN}" stroke-width="1.5"/>` +
  `<text x="9" y="12.6" text-anchor="middle" font-family="system-ui, sans-serif" font-size="10.5" ` +
  `font-weight="700" fill="${GREEN}">$</text></svg>`

type Gauge = { label: string; percent: number; note?: string }

const gaugesOf = (used: Usage | null, now: number): Gauge[] => {
  const fiveHour = used?.limits.find(limit => limit.kind === 'five_hour')
  const sevenDay = used?.limits.find(limit => limit.kind === 'seven_day')
  const found: Gauge[] = []

  if (fiveHour !== undefined) {
    found.push({ label: '5h', percent: fiveHour.percentUsed, note: timeLeft(fiveHour, now) })
  }

  if (sevenDay !== undefined) {
    found.push({ label: '7d', percent: sevenDay.percentUsed, note: timeLeft(sevenDay, now) })
  }

  if (used?.percent !== undefined) {
    const note = used.tokens === undefined ? undefined : `${tokens(used.tokens)}/${tokens(used.window)}`
    found.push({ label: 'ctx', percent: used.percent, note })
  }

  return found
}

export const register: Register = on => {
  on('session.start', async ($, e, next) => {
    await Promise.all([refreshWhere($), refreshGit($), refreshUsage($)])

    return next(e)
  })

  // `/model`, `/cd` and the config menu change what the band shows with no
  // turn in between, and a picker may answer after its command returned.
  on('command.run', async ($, e, next) => {
    const ran = await next(e)
    await Promise.all([refreshWhere($), refreshGit($)])
    $.clock.after(2000, () => void refreshWhere($))

    return ran
  })

  on('config.set', async ($, e, next) => {
    const set = await next(e)
    await refreshWhere($)

    return set
  })

  on('prompt.submit', async ($, e, next) => {
    await refreshWhere($)

    return next(e)
  })

  on('turn.step', async function* ($, e, next) {
    await update($, effort, () => (e.effort === undefined ? null : String(e.effort)))

    return yield* next(e)
  })

  on('turn.complete', async ($, e, next) => {
    const done = await next(e)
    await Promise.all([refreshWhere($), refreshGit($)])

    return done
  })

  on('session.measure', async ($, e, next) => {
    const found: Usage = { ...e.context, limits: e.rateLimits, usd: e.cost?.usd }
    await update($, usage, () => found)

    return next(e)
  })

  on('ui.render', { component: 'AbovePrompt' }, async ($, e, next) => {
    const place = await read($, where)

    if (e.props.hasSurvey || place === null) {
      return next(e)
    }

    const repo = await read($, git)
    const used = await read($, usage)
    const level = await read($, effort)
    const gauges = gaugesOf(used, await $.clock.now())
    const cost = used?.usd === undefined ? undefined : `$${used.usd.toFixed(2)}`
    const isDirty = repo !== null && repo.added + repo.deleted > 0
    const columns = e.props.bodyColumns

    // Desktop: a card of ring gauges. The app already shows folder and model.
    if (e.surface === 'desktop') {
      const { Box, Text, Svg } = $.ui.resolve(e)
      const context = gauges.find(gauge => gauge.label === 'ctx')

      return (
        <Box
          flexDirection="row"
          justifyContent="space-between"
          alignItems="center"
          borderStyle="round"
          borderDimColor
          paddingX={1}
        >
          <Box flexDirection="row" alignItems="center" gap={3}>
            {gauges
              .filter(gauge => gauge.label !== 'ctx')
              .map(gauge => (
                <Box flexDirection="row" alignItems="center" gap={1}>
                  <Svg
                    source={ring(gauge.percent)}
                    alt={`${gauge.label} ${Math.round(gauge.percent)}%`}
                    width={18}
                    height={18}
                  />
                  <Text bold>{Math.round(gauge.percent)}%</Text>
                  <Text dimColor>
                    {gauge.label}
                    {gauge.note === undefined ? '' : ` · ${gauge.note}`}
                  </Text>
                </Box>
              ))}
            {context !== undefined && (
              <Box flexDirection="row" alignItems="center" gap={1}>
                <Svg
                  source={meter(context.percent)}
                  alt={`context ${context.percent}%`}
                  width={METER_WIDTH}
                  height={18}
                />
                <Text bold>{context.percent}%</Text>
                <Text dimColor>ctx{context.note === undefined ? '' : ` · ${context.note}`}</Text>
              </Box>
            )}
          </Box>
          <Box flexDirection="row" alignItems="center" gap={2}>
            {repo !== null && <Text dimColor>⎇ {repo.branch}</Text>}
            {repo !== null && isDirty && <Text color={GREEN}>+{repo.added}</Text>}
            {repo !== null && isDirty && <Text color={RED}>−{repo.deleted}</Text>}
            {used?.usd !== undefined && (
              <Box flexDirection="row" alignItems="center" gap={1}>
                <Svg source={COIN} alt="cost" width={18} height={18} />
                <Box flexDirection="row">
                  <Text bold color={GREEN}>
                    {Math.floor(used.usd)}
                  </Text>
                  <Text color={GREEN} dimColor>
                    .{used.usd.toFixed(2).split('.')[1]}
                  </Text>
                </Box>
              </Box>
            )}
          </Box>
        </Box>
      )
    }

    const { Box, Text } = $.ui.resolve(e)
    const cells = columns >= 110 ? 8 : 5
    const isNarrow = columns < 70

    const meters = (
      <Box flexDirection="row" gap={isNarrow ? 2 : 3}>
        {gauges.map(gauge => {
          const filled = Math.round((clamp(gauge.percent) * cells) / 100)

          return (
            <Box flexDirection="row" gap={1}>
              <Text dimColor>{gauge.label}</Text>
              {!isNarrow && (
                <Box flexDirection="row">
                  <Text color={levelColor(gauge.percent)}>{'━'.repeat(filled)}</Text>
                  <Text dimColor>{'━'.repeat(cells - filled)}</Text>
                </Box>
              )}
              <Text bold color={levelColor(gauge.percent)}>
                {Math.round(gauge.percent)}%
              </Text>
              {!isNarrow && gauge.note !== undefined && <Text dimColor>{gauge.note}</Text>}
            </Box>
          )
        })}
      </Box>
    )

    if (isNarrow) {
      return (
        <Box flexDirection="row" justifyContent="space-between" width={columns}>
          {meters}
          {cost !== undefined && <Text color={GREEN}>{cost}</Text>}
        </Box>
      )
    }

    return (
      <Box flexDirection="column" width={columns}>
        <Box flexDirection="row" justifyContent="space-between" paddingRight={COLLAPSE_CELLS}>
          <Box flexDirection="row" gap={2}>
            <Text bold color="cyan">
              {place.cwd}
            </Text>
            {repo !== null && <Text color="magenta">⎇ {repo.branch}</Text>}
            {repo !== null && isDirty && (
              <Box flexDirection="row" gap={1}>
                <Text color={GREEN}>+{repo.added}</Text>
                <Text color={RED}>−{repo.deleted}</Text>
              </Box>
            )}
          </Box>
          <Box flexDirection="row" gap={1}>
            <Text>{place.model}</Text>
            {level !== null && <Text dimColor>· {level}</Text>}
          </Box>
        </Box>
        <Box flexDirection="row" justifyContent="space-between">
          {meters}
          {cost !== undefined && (
            <Text bold color={GREEN}>
              {cost}
            </Text>
          )}
        </Box>
      </Box>
    )
  })
}
