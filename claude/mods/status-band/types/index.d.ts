export type Limit = { kind: string; percentUsed: number; resetsAt?: string }

export type Usage = {
  tokens?: number
  window: number
  percent?: number
  limits: Limit[]
  usd?: number
}

export type Git = { branch: string; added: number; deleted: number }

export type Where = { cwd: string; model: string }

declare module 'claude-code' {
  interface PluginState {
    'status-band': {
      usage: Usage | null
      git: Git | null
      where: Where | null
      effort: string | null
    }
  }
}
