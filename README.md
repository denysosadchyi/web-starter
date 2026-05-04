# web-starter

Vanilla HTML + CSS + JS skeleton for any new website project. No build step, no framework, no lock-in. Designed to be paired with **Claude Code** (or any AI coding assistant) so designers can build sites without producing AI-slop.

## What's inside

- **`starter/`** — the actual project skeleton. Copy this into a new project folder.
  - `CLAUDE.md` — auto-loaded into Claude Code's context. Contains all hard rules.
  - `.claude/commands/` — project-scoped slash commands (`/component`, `/hero`, `/audit-slop`, `/mobile-check`, `/new-token`).
  - `.claude/settings.json` — pre-approved permission allowlist (less prompt spam).
  - `assets/css/tokens.css` + neutral defaults; reference components (header, footer, buttons, faq, form-input, example-card).
- **`docs/`** — conventions, rules, playbooks. Read before writing code.
- **`templates/`** — deploy configs for Netlify / Vercel / GitHub Pages.
- **`scripts/lint-tokens.sh`** — find hardcoded hex/px/em-dash before commit.

## Quick start

```bash
git clone https://github.com/denysosadchyi/web-starter.git my-new-site
cd my-new-site
rm -rf .git && git init
cd starter && python3 -m http.server 8000
# open http://localhost:8000
```

Replace `--font-base` and `--brand` in `starter/assets/css/tokens.css` with the real font and palette. Everything else cascades.

## Read these in order

For **designers using Claude Code**:

1. [Start here](docs/00-start-here.md) — first 30 min onboarding (UA)
2. [Anti-slop](docs/anti-slop.md) — patterns that mark a design as AI-generated; do not produce them
3. [Copy rules](docs/copy-rules.md) — how to write text that doesn't read as ChatGPT (UA)
4. [Assets workflow](docs/assets-workflow.md) — where to get photos / icons / fonts (UA)

For **developers** building the actual site:

5. [Architecture](docs/architecture.md) — folder structure, component conventions, hard rules
6. [Tokens](docs/tokens.md) — design tokens (single source of truth)
7. [Type system](docs/type-system.md) — typography rules
8. [Responsive](docs/responsive.md) — two-breakpoint convention + mobile playbook
9. [Preview](docs/preview.md) — local dev / LAN preview / deploy

## Slash commands (inside Claude Code)

When working on a project copied from this starter, these commands are available:

- `/component <name>` — create a new CSS component following project conventions
- `/hero <project description>` — generate a hero section without AI-slop patterns
- `/audit-slop` — scan current code for anti-slop patterns
- `/mobile-check` — run the mobile adaptation checklist on current code
- `/new-token <name> <value>` — add a design token to `tokens.css` properly

## Lint

```bash
./scripts/lint-tokens.sh
```

Catches: hardcoded hex colors, hardcoded `rgb()`/`rgba()` (use rgba(var(--*-rgb)) instead), hardcoded `font-size px`, hardcoded `font-weight` numbers, em-dashes in HTML copy. Run before every commit.

## Philosophy

- **Vanilla.** No framework lock-in. Everything ports to any stack in an afternoon.
- **Tokens first.** Every color, size, weight, shadow, radius lives in `tokens.css`. Hardcoding in a component is a bug.
- **One file per component.** Self-contained, scoped, readable. Drop-in reusable across pages.
- **Two breakpoints, period.** 980 (tablet) and 720 (mobile). If layout breaks between them, fix the layout.
- **Anti-slop is non-negotiable.** Read `docs/anti-slop.md` before any visual work. Default = slop. Pick the less-default answer.

## What this is not

- Not a UI library. There are no pre-built widgets to import.
- Not opinionated about fonts or colors. Tokens ship neutral; pick a real palette and font on day 1.
- Not a build system. If a project grows to need bundling, lift the pieces out and put them in your bundler of choice.
