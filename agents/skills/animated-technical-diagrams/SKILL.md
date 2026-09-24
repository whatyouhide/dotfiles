---
name: animated-technical-diagrams
description: Design and build polished animated technical diagrams and honest simulations for articles, docs, and explainers. Use when a visual must show systems, messages, queues, state changes, causality, or time. Do not use for ordinary data charts or decorative page motion.
---

# Animated Technical Diagrams

Create simulations that remain technically true while gaining the clarity and finish of an authored diagram.

The main design rule is: **the model decides what happens; the presentation decides what the reader should notice.** Do not replace a simulation with a fixed animation merely to make it easier to stage.

## Before implementation

Write a short simulation contract:

- **Question:** The one process or causal relationship the visual must explain.
- **Entities:** The nodes, stores, queues, messages, counters, and limits that matter.
- **Invariants:** Rules the simulation must never break.
- **Inputs:** Values the reader can change, if any.
- **Observable state:** Values that help the reader understand the outcome.
- **Focus sequence:** The small set of meaningful events the presentation will emphasize.

If the visual cannot be summarized as one question, split it.

## Choose the rendering model

Prefer SVG when spatial relationships matter: nodes, connectors, packets, graphs, timelines, storage layouts, and state machines. Use HTML around the SVG for controls and prose. Use Canvas only when the number of moving marks makes SVG costly. Do not use absolutely positioned HTML boxes when connector geometry is central to the visual.

Read [references/simulation-state.md](references/simulation-state.md) before implementing time, events, simulation state, autoplay, or controls.

Read [references/svg-visual-grammar.md](references/svg-visual-grammar.md) when designing or reviewing the visual system, layout, typography, color, SVG primitives, or responsive behavior.

## Composition rules

- Give article text and diagrams different width limits. On desktop, a diagram can be about 1.35 to 1.55 times the text width.
- Make the diagram useful when paused. Motion must add causality, not supply missing structure.
- Give each moment one main focus. Keep the rest visible but quiet.
- Put state labels and counters near the object they describe.
- Use direct labels instead of legends when space permits.
- Use one main accent. Add other colors only when they encode distinct states that the reader must compare.
- Prefer a flat field, thin borders, and low-contrast surfaces. Avoid grids, glow, deep shadows, nested cards, and status lights unless they convey information.
- Keep controls visually secondary. Autoplay-only simulations are valid. Add Back, Pause, Next, phase buttons, or parameter controls only when they improve study or input.

## Motion rules

- Show cause before effect.
- Move messages along the path that carries them.
- Reveal dependent data only after the event that makes it known.
- Use short transitions for state changes and longer travel time for network or process movement.
- Add a brief dwell after meaningful changes so the reader can see the result.
- Use linear motion for packets and work. Use restrained ease-out for reveals. Do not use bounce unless the domain has physical behavior.
- Pause work when the diagram is off screen.
- Honor `prefers-reduced-motion`. Apply the same state changes without decorative travel.

## Implementation shape

Keep these layers separate:

1. **Model state:** The true system state and invariants.
2. **Event state:** In-flight work with start time, duration, source, destination, and result.
3. **Presentation state:** Focus, active phase, camera offset, highlights, and temporary labels.
4. **Renderer:** A pure or near-pure mapping from derived state to SVG and control state.

A named phase system can exist without phase buttons. It can drive focus, labels, accessibility text, timing, and deterministic replay while the simulation continues to compute real outcomes.

## Required review

Check the result at rest, during motion, after a resize, in reduced-motion mode, and after leaving and returning to the viewport.

Reject the result if:

- several elements compete for attention;
- the diagram needs prose to identify its basic entities;
- controls or stats take more visual weight than the simulated system;
- motion is active but does not explain a dependency;
- labels become too small at the target viewport;
- replay produces a different result without a deliberate random seed or user input;
- the visual breaks an invariant to create a cleaner sequence.
