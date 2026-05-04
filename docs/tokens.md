# Tokens

`assets/css/tokens.css` is the single source of truth for every visual value in the project. Every component reads from it. Hardcoding a hex or px in a component is a bug.

## Categories

The `:root` block in `tokens.css` is organized into the same categories every time. Keep this order — it makes diffs and code reviews readable.

```
:root {
  /* ── Font families ──────────── */
  /* ── Font sizes ─────────────── */
  /* ── Font weights ───────────── */
  /* ── Tracking ───────────────── */
  /* ── Leading ────────────────── */
  /* ── Text colors ────────────── */
  /* ── Surfaces ───────────────── */
  /* ── Borders ────────────────── */
  /* ── Brand & accent ─────────── */
  /* ── Shadows ────────────────── */
  /* ── Radii ──────────────────── */
  /* ── Spacing scale ──────────── */
  /* ── Layout ─────────────────── */
  /* ── Breakpoints (reference) ── */
}
```

## Font sizes

Named by **role**, not by t-shirt size. `--fs-h1` is for the page-level display heading, not "big text." This makes it obvious in components which token to reach for.

Standard set (extend as needed):

| Group | Tokens |
| --- | --- |
| Display & headings | `--fs-h1`, `--fs-h1-md`, `--fs-h1-sm`, `--fs-h2`, `--fs-h2-sm`, `--fs-h3`, `--fs-h4` |
| Metrics | `--fs-metric`, `--fs-metric-sm` |
| Body | `--fs-body`, `--fs-subhead`, `--fs-lead`, `--fs-sm`, `--fs-caption`, `--fs-micro` |
| Labels & controls | `--fs-kicker`, `--fs-label`, `--fs-badge`, `--fs-btn`, `--fs-input` |

## Spacing scale

**Pixel-named.** `--space-N` always means `Npx`. The value is unambiguous from the token, and you don't have to memorize a t-shirt-to-pixel mapping.

```
--space-2, --space-3, --space-4, --space-5, --space-6, --space-7, --space-8,
--space-10, --space-12, --space-14, --space-16, --space-20, --space-24,
--space-32, --space-40, --space-48, --space-56, --space-64, --space-72,
--space-88, --space-100, --space-120, --space-144, --space-180
```

If a value you need isn't in the scale, **add a new `--space-N` token first, then use it.** Don't inline a raw px number.

**Negative offsets** (rare — pull-up overlaps) stay inline as a literal negative px since CSS variables don't compose with `-` cleanly. Comment the line with the intent.

## Colors — RGB fragments for alpha composition

When you need a semi-transparent version of a color, don't define `--brand-30` (30% alpha) as a separate token. Define an RGB fragment alongside the hex token, then compose with `rgba(...)`:

```css
:root {
  --brand:     #00a7e5;
  --brand-rgb: 0, 167, 229;
}

.button:hover {
  box-shadow: 0 4px 18px rgba(var(--brand-rgb), .45);
}
```

This keeps any future palette tweak in one place — change the hex and the rgb fragment, every alpha use updates automatically.

Apply to: brand colors, ink (text), and any background that needs alpha overlays.

## Shadows

Named by **role**, not by visual size. `--shadow-sm` / `--shadow-md` / `--shadow-lg` is fine for neutral elevation. For specific use cases, name the role:

```
--shadow-brand          /* primary button base glow */
--shadow-brand-hover    /* primary button hover glow */
--shadow-glass          /* dark glass card on photo bg */
--shadow-header         /* floating site header */
```

Always use the token. Never write a bespoke `box-shadow` in a component.

## Radii

```
--radius-sm:   8px      /* small controls */
--radius:     14px      /* cards, default */
--radius-md:  16px
--radius-lg:  20px      /* featured blocks */
--radius-xl:  28px
--pill:      999px      /* buttons, chips, full pills */
```

## Breakpoints — reference only

```
--bp-tablet: 980px
--bp-mobile: 720px
```

CSS custom properties **cannot** be used inside `@media` queries. These tokens are reference-only — component `@media` queries must use the literal values:

```css
@media (max-width: 980px) { ... }
@media (max-width: 720px) { ... }
```

If you change a breakpoint, do a project-wide search/replace.

## How to extend

Add tokens when:

- A value repeats across two or more components
- A designer asks for "the [thing] color" — the project now has a named role for it
- You need a new alpha composition (add the rgb fragment alongside the hex)

Do **not** add tokens for:

- One-off internal geometry (icon sizes, animation deltas, aspect ratios)
- Component-internal computed offsets
- Anything you'll only ever use once in one place

When in doubt: add the token. Diffs are cheap, hardcoded values rot.

## How to remove

If a token is unused, delete it. Run a grep across the project before deleting:

```bash
grep -r "--my-token" .
```

If only the definition matches, it's dead. Remove.
