# Simulation state and motion

Use this reference for true simulations, autoplay, event choreography, replay, or controls.

## State architecture

Keep truth and emphasis separate.

```ts
type ModelState = {
  time: number;
  entities: EntityState[];
  counters: Record<string, number>;
};

type InFlightEvent = {
  id: string;
  kind: string;
  source: string;
  destination: string;
  startedAt: number;
  duration: number;
  payload?: unknown;
};

type PresentationState = {
  phase: string;
  focusIds: string[];
  cameraOffset?: number;
  annotation?: string;
};
```

The simulation advances `ModelState` and resolves `InFlightEvent` records. The view derives highlights and geometry from that state. A phase can change focus and timing, but it must not invent model results.

## Simulation modes

Choose one mode explicitly.

### Discrete event

Use for requests, commits, retries, queue changes, consensus, and messages. Put events in a time-ordered queue. Resolve an event only when its duration ends.

### Continuous

Use for rates, accumulation, flow, resource use, and changing inputs. Advance with a capped delta or fixed timestep. Derive thresholds as events when they cause a meaningful change.

### Hybrid

Use a continuous model with discrete causal events. This fits most system simulations. For example, a queue can fill continuously while demand requests and fetch completions remain discrete events.

## Clock rules

- Use `requestAnimationFrame` only while visible and running.
- Cap large frame deltas after a blocked tab. A fixed timestep is better when exact replay matters.
- Cache element references. Do not query the full DOM each frame.
- Update transforms, opacity, SVG attributes, and text that changed. Avoid layout reads inside the frame loop.
- Preserve state when a diagram leaves the viewport unless restarting is part of the stated behavior.
- Use a seed for generated IDs, traffic, failures, or delays when replay must be stable.

## Presentation phases

Use a small vocabulary that describes domain events, not generic animation stages. Good examples include `REQUEST`, `FETCH`, `COMMIT`, `RETRY`, and `REFILL`.

A phase can control:

- the primary focus;
- an active path or node;
- camera movement or a clipped viewport;
- a short annotation;
- the autoplay dwell time;
- screen-reader status text;
- optional Back and Next behavior.

Phase buttons are optional. Without them, keep the phase system internal or show only a small current-action label.

For deterministic Back and Next, store snapshots or replay from a seed and an event index. Do not reverse a live simulation by subtracting effects unless the model supports reversal.

## Timing defaults

Treat these as starting values, not rules:

| Change | Typical duration |
|---|---:|
| Fill, stroke, or opacity response | 140 to 220 ms |
| Local message travel | 400 to 700 ms |
| Network or process travel | 700 to 1200 ms |
| Camera shift | 300 to 500 ms |
| Dwell after a result | 250 to 600 ms |
| Full autoplay loop | 8 to 20 seconds |

Use linear easing for packets and progress. Use restrained ease-out for reveals and camera shifts.

## Causal choreography

For each event, show this order when it applies:

1. The source becomes active.
2. The operation or message appears.
3. The message travels along its actual path.
4. The destination receives it.
5. The destination changes state.
6. Derived counters and dependent objects update.
7. The view dwells before the next event.

Do not reveal a pointer, result, queue item, or dependent node before the event that makes it available.

## Inputs and controls

Parameter controls change the model. Playback controls change presentation time.

- Label each input with its unit and current value.
- Apply input changes at a valid model boundary when an immediate change would break an invariant.
- Keep Pause available when the reader must inspect fast state changes.
- Add Back and Next only when discrete study is useful.
- Add named phase buttons only when direct seeking helps more than it adds visual weight.

## Reduced motion

Keep the same causal order and final values. Remove travel interpolation, camera motion, pulsing, and decorative transitions. Apply each event outcome at a readable pace or expose a manual advance control when autoplay would become unclear.
