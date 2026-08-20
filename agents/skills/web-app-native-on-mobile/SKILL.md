---
# Originally from https://x.com/emilkowalski/status/2087150812761858367.
name: web-app-native-on-mobile
description: Tips and tricks to make a web app feel more native on mobile.
---

Use this whenever working on a web app that needs to be used on mobile, or whenever the user asks to make a web app perform like "native" on mobile.

| Problem                        | Solution                                                |
| ------------------------------ | ------------------------------------------------------- |
| Hover state stuck after tap    | Wrap in '@media (hover: hover) and (pointer: fine)      |
| Gray/blue flash on tap         | Kill `-webkit-tap-highlight-color`                      |
| Layout has wrong height        | `100dvh` (app) or `100svh` (hero)                       |
| Page zooms into input          | Input's font size should be 16px at the minimumum       |
| Tap feels laggy                | Feedback on pointer-down + `touch-action: manipulation` |
| Pull-to-refresh hijacks scroll | `overscroll-behavior: none` on `html, body`             |
| Content stops at the notch     | `viewport-fit=cover` + `env(safe-area-inset-*)`         |
| Long-press selects button text | Add `user-select: none`                                 |
| Carousel scrolls vertically    | `touch-action: pan-y` on the gesture surface            |
| Status bar color doesn't match | `theme-color` per color scheme                          |
