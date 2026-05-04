# Anti-slop

**READ THIS BEFORE generating or editing any UI, layout, color, type, or motion.**

These are the patterns that mark a design as AI-generated. Avoid them.

> **The default option is usually slop. Pick the less-default answer.**

Source inspiration: <https://impeccable.style/slop/>.

---

## Visual treatment — DON'T

- Thick accent border on a rounded card (the #1 AI-UI tell — side-tab stripe in brand color)
- Glassmorphism, glow borders, blurred panels for decoration
- Drop-shadowed rounded rectangles as the default container for everything
- Sparklines / mini-charts that don't carry real data
- Icon-tile stacked above heading (universal AI feature-card template)
- Nested cards (cards inside cards)
- Wrapping every block in a bordered card

## Color — DON'T

- Purple/violet gradients
- Cyan-on-dark
- Glowing colored box-shadows on dark mode
- Pure `#000` background (tint toward brand hue or warm/cool slate)
- Dark mode as a "safe" default (it isn't — it's a choice that needs to fit the brand)
- Gradient text on headings
- Gray text on colored backgrounds (washed out, low contrast)
- Anything below WCAG AA: 4.5:1 body, 3:1 large

## Typography — DON'T

- Use only Inter / Roboto / Geist / Fraunces / Plus Jakarta Sans / Space Grotesk (overused). If one is locked-in, pair with a contrasting display face.
- Single font for everything (need ≥2 faces or one face with strong weight contrast — see [type-system.md](type-system.md))
- Flat hierarchy. Need ≥1.25 ratio between size steps (e.g. 14 / 18 / 24 / 32 / 48)
- All-caps body text (uppercase only for short labels / kickers)
- Monospace as "technical" vibes
- Body text below 14px (16px ideal)
- Line-height below 1.3 on body (1.5–1.7 ideal)
- Letter-spacing above 0.02em on body
- Line length above ~80 characters (cap at 65–75ch with `max-width`)
- Justified text without `hyphens: auto`

## Layout & space — DON'T

- Center every text element. Center only hero blocks and CTA blocks.
- "Big metric + 3 supporting stats with gradient" hero
- Grid of 3–4 identical cards. Vary size / treatment / alignment.
- Single spacing value everywhere. Need rhythm: tight within group, large between groups.
- Cramped padding (need ≥12–16px inside containers)
- Reach for a modal as the default interaction container

## Motion — DON'T

- Bounce / elastic easing. Use `ease-out-quart` / `quint` / `expo`.
- Animate `width`, `height`, `padding`, `margin`. Use `transform`, `opacity`, `grid-template-rows`.

## Interaction — DON'T

- Style every button as primary. One primary per screen; rest are ghost / link / secondary.
- Restate headings in intros, repeat titles in labels, echo captions in cards. Each text block earns its place.

## Responsive — DON'T

- Hide or remove **features** on mobile. Adapt the layout. (Hiding visual duplicates is fine — see [responsive.md](responsive.md).)

## Accessibility — DON'T

- Skip heading levels (h1 → h3 with no h2)
- Icon-only buttons without `aria-label`
- Color as the only signal (e.g. red-only error state, no icon or text)

## Gut-checks before shipping a visual change

1. Could this be the output of a one-shot LLM prompt? → Push past the first idea.
2. Does this look like Vercel's example app or a v0.dev template? → Change something deliberate.
3. Am I making a *choice* here, or defaulting? → Default = slop.

## How to use this doc

- **Before any visual work**, scan the relevant section.
- **During code review**, flag matches as "slop risk" — push for an alternative.
- **In design audits**, list matches as findings, not as silent fixes. The team should see the pattern named.
- **When asking an AI for design help**, paste the relevant section into the prompt. Models will avoid these patterns when explicitly told.
