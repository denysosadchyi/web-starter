# Architecture

How the starter is organized, why, and the hard rules every contributor follows.

## Folder structure

```
starter/
├── index.html                       # entry page
└── assets/
    ├── css/
    │   ├── tokens.css               # design tokens — single source of truth
    │   ├── base.css                 # reset + element defaults
    │   ├── layout.css               # page-level primitives (.container, section.block)
    │   └── components/              # one CSS file per component
    │       └── example-card.css
    ├── js/
    │   └── main.js                  # all interactive behavior, vanilla
    └── icons/                       # SVGs (or use Lucide via CDN)
```

Add new pages as siblings of `index.html` (`about.html`, `pricing.html`). They share the same `assets/`.

## Loading order in `<head>` (cascade matters)

1. `tokens.css` — first; everything reads from it
2. `base.css` — element defaults
3. `layout.css` — page-level primitives
4. `components/*.css` — order within this group is irrelevant; components are scoped

When you add a new component file, append a `<link>` next to its peers.

## Component file template

Every component CSS file follows this shape:

```css
/* ==========================================================================
   <name>.css — one-line description
   Markup: <expected HTML skeleton, abbreviated>
   Notes:  any non-obvious dependency or dark-bg override
   ========================================================================== */

.<base> { ... }
.<base>-<variant>, .<base>--<modifier> { ... }
.<base> .<descendant> { ... }

/* ── Responsive ───────────────────────────────────────────── */
@media (max-width: 980px) { ... }
@media (max-width: 720px) { ... }
```

If a component has no responsive change, omit the section. Don't leave an empty stub.

## Naming convention

BEM-ish but pragmatic.

- `.card` — block
- `.card .body`, `.card .photo` — descendants (space, not `__`)
- `.card--featured`, `.icon--star` — variants (`--` modifier)
- `.btn-primary`, `.btn-sm` — historical button conventions are fine to keep

Keep selectors flat. Two levels of nesting max in practice (`.card .body .meta` is the limit before something is wrong).

## JavaScript convention

`assets/js/main.js` is one file with numbered sections:

```js
/* ==========================================================================
   main.js
   1. Header scroll behavior
   2. Mobile menu
   3. Disclosure / accordion
   4. <whatever else>
   ========================================================================== */

/* 1. Header scroll behavior ─────────────────────────────────────────────── */
// ...

/* 2. Mobile menu ────────────────────────────────────────────────────────── */
// ...
```

When this file approaches ~300 lines, split sections into `assets/js/<name>.js` and load them at the bottom of `<body>` in dependency order.

No build step. No bundler. If a project needs `npm install`, this starter is no longer the right base.

## The hard rules

These are non-negotiable. They are what makes the codebase stay clean as it grows.

1. **No hardcoded colors.** Every `color`, `background`, `border-color`, `box-shadow`, `fill` references a token. If a value isn't in `tokens.css`, add it first.
2. **No hardcoded font sizes / weights / spacing tokens.** Same rule. Reach for `--fs-*`, `--fw-*`, `--ls-*`, `--lh-*`, `--space-*`.
3. **No hardcoded radii or shadows.** Use `--radius-*` and `--shadow-*` tokens.
4. **One concern per component file.** A component does not reach into another component's selectors. Cross-component layout (gap between sections, container width) lives in `layout.css`.
5. **Components don't know about pages.** A component dropped into a different HTML file must still render correctly, with no global page-specific overrides.
6. **Markup is a contract.** The class names a component expects (e.g. `.card .photo`, `.live-card .text .big`) are part of its public API. Don't rename without updating consumers.
7. **One H1 per page.** Hero / page header only. Skipping heading levels (h1 → h3) is a bug.
8. **Two breakpoints only.** 980 and 720. See [responsive.md](responsive.md).

## Component-internal geometry — the exception

The "no hardcode" rule applies to **spacing / radius / typography / color / shadow**.

**Internal geometry** (icon size 18, save-button 38, photo aspect-ratio, animation deltas inside `transform: translateY(...)`) stays in the component file as plain `width / height / transform` values. These are not "design tokens" — they are component implementation details.

If you find yourself reusing the same internal pixel value across two components, it's probably a token.

## Adding a new component

1. Create `assets/css/components/<name>.css` using the file template above.
2. Append a `<link rel="stylesheet" href="assets/css/components/<name>.css">` in `<head>`, next to existing component links.
3. If the component needs interactive behavior, add a numbered section to `main.js`.
4. If it needs a new design value, add the token to `tokens.css` first, then use it in the component.

## Adding a new page

1. Copy `index.html` as the starting point.
2. Keep the same `<link>` order. Pages share `tokens.css`, `base.css`, `layout.css`.
3. Drop in only the component CSS the new page actually uses.
4. Add per-page meta (title, description, OG tags) in the `<head>`.

## Production porting

When migrating to React / Vue / Svelte / etc.:

- `tokens.css` → your stack's theme system (Tailwind `theme.extend`, Style Dictionary input, CSS-in-JS theme, plain CSS `:root`).
- Each `components/<name>.css` → one component module. The CSS body is portable; you swap selectors for whatever scoping mechanism you use (CSS modules, scoped Vue styles, styled-components, Tailwind via `@apply`).
- `main.js` sections → component-level state and effects.

The class-name contract is the part you must preserve if you keep the CSS as-is. If you rewrite styles in CSS-in-JS or a Tailwind dialect, the contract becomes "the component renders the same DOM with the same per-element semantics" — at that point class names are an internal detail.
