# SVG visual grammar

Use this reference to design or review the diagram surface.

## Coordinate system and layout

- Start with a stable `viewBox`, often between 920 and 1080 units wide and 400 to 560 units tall for a desktop article diagram.
- Use `preserveAspectRatio="xMidYMid meet"` unless cropping is deliberate.
- Group related shapes with `<g>` and move the group with `transform`.
- Use `<clipPath>` for scrolling histories, logs, queues, or camera windows.
- Add `vector-effect="non-scaling-stroke"` where a line must remain crisp during scaling.
- Keep three to seven primary entities visible. Group or summarize secondary entities.

In an article, aim for a text rail near 640 to 680 px and a visual rail near 920 to 1040 px on a wide viewport. These are defaults. The required label size and content decide the final width.

## Reusable primitives

Build a small shared set before building several diagrams:

- stage or service node;
- storage node;
- queue or log;
- directed edge and arrowhead;
- lane or boundary;
- moving message or packet;
- state badge;
- local counter;
- progress bar;
- viewport mask;
- annotation label.

Use the same geometry, label positions, and state attributes across diagrams. Prefer `data-state`, `data-kind`, and `data-tone` over one-off class combinations.

## Visual hierarchy

Use three contrast levels:

1. **Active:** The current cause, message, or result.
2. **Available:** Relevant system structure that is not active.
3. **Context:** History, inactive nodes, storage contents, and future work.

Most of the diagram should sit in levels 2 and 3. If everything uses the accent, the accent conveys nothing.

Use a flat background or a very quiet surface. A single 1 px frame can define the visual area. Avoid deep shadows, repeated cards, background grids, glow, and decorative status lights unless they carry state.

## Color

Define semantic tokens rather than component colors:

```css
.technical-viz {
  --viz-bg: var(--page-bg);
  --viz-surface: color-mix(in srgb, var(--page-fg) 4%, transparent);
  --viz-line: color-mix(in srgb, var(--page-fg) 20%, transparent);
  --viz-muted: color-mix(in srgb, var(--page-fg) 58%, transparent);
  --viz-fg: var(--page-fg);
  --viz-accent: var(--page-accent);
}
```

Use one main accent for focus. Add read, write, warning, or failure colors only when those states must remain distinct at the same time. Verify contrast in both light and dark modes.

## Typography

- Use the article's mono font for technical labels, object IDs, operation names, and counters.
- Start around 10 to 12 SVG units for small labels and 12 to 15 for key labels in a 1000-unit-wide viewBox.
- Use uppercase and light tracking for short category labels only.
- Use tabular numbers for counters.
- Keep text horizontal when possible.
- Put labels next to their objects. Avoid legends when direct labels fit.
- Do not scale a desktop diagram until labels become unreadable on mobile.

## Shape and line treatment

- Use 1 px or similarly light strokes.
- Use small corner radii, often 3 to 5 units.
- Use solid edges for established relationships and dashed edges for unknown, pending, optional, or future relationships.
- Keep arrowheads small and consistent.
- Use a subtle fill change and stroke change for active nodes. Do not depend on glow.
- Animate group transforms when a node and its label move together.

## Responsive behavior

Do not treat a dense desktop SVG as a thumbnail.

In this order:

1. Remove secondary detail.
2. Regroup entities into a vertical or two-row layout.
3. Change the viewBox and camera window.
4. Use a separate compact composition.
5. Use horizontal scrolling only when the spatial sequence must remain horizontal.

Keep touch targets outside the scaled SVG when possible. Let HTML controls retain normal target sizes.

## Accessibility

- Give the SVG `role="img"` and a useful accessible name.
- Add `<title>` and `<desc>` when they improve the static description.
- Mark decorative marks as hidden from assistive tools.
- Put interactive controls in HTML unless SVG interaction is essential.
- Make all controls keyboard accessible.
- Expose important changing state through a concise status region. Do not announce every animation frame.

## Review checklist

- Can the reader identify every primary entity while paused?
- Is the current cause or event clear within one second?
- Does each moving mark follow a real path?
- Do dependent values update after their cause?
- Does any panel, grid, shadow, metric, or status light add more weight than meaning?
- Are diagrams wider than prose when added width improves understanding?
- Are labels readable at every target viewport?
- Does the visual remain clear in reduced-motion mode?
- Does light mode preserve hierarchy without relying on glow?
- Can several diagrams share the same primitives without looking copied or generic?
