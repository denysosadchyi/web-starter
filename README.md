# web-starter

Vanilla HTML + CSS + JS skeleton for any new website project. No build step, no framework, no lock-in.

The point is **portability**: the markup and tokens are reference; absorb them into React / Vue / Svelte / Astro / WordPress / whatever the production stack ends up being.

## What's inside

- **`starter/`** — the actual project skeleton. Copy this into a new project folder.
- **`docs/`** — conventions and rules. Read before writing code.

## Quick start

```bash
cp -r starter/ ../my-new-site/
cd ../my-new-site/
python3 -m http.server 8000
# open http://localhost:8000
```

That is the entire toolchain.

## Read these in order

1. [Architecture](docs/architecture.md) — folder structure, component conventions, the hard rules
2. [Tokens](docs/tokens.md) — design tokens (single source of truth for every visual value)
3. [Type system](docs/type-system.md) — font, weights, sizes, tracking, leading rules
4. [Responsive](docs/responsive.md) — two-breakpoint convention + mobile adaptation playbook
5. [Anti-slop](docs/anti-slop.md) — patterns that mark a design as AI-generated; do not produce them
6. [Preview](docs/preview.md) — local dev server, LAN preview, hot-reload options

## Philosophy

- **Vanilla.** No framework lock-in. Everything ports to any stack in an afternoon.
- **Tokens first.** Every color, size, weight, shadow, radius lives in `tokens.css`. Hardcoding in a component is a bug.
- **One file per component.** Self-contained, scoped, readable. Drop-in reusable across pages.
- **Two breakpoints, period.** 980 (tablet) and 720 (mobile). If layout breaks between them, fix the layout — do not add a third breakpoint.
- **Read anti-slop before any visual work.** The default option is usually slop. Pick the less-default answer.

## What this is not

- Not a UI library. There are no pre-built widgets to import.
- Not opinionated about fonts or colors. Tokens ship neutral; pick a real palette and font on day 1 of a project.
- Not a build system. If a project grows to need bundling, lift the pieces out and put them in your bundler of choice.
