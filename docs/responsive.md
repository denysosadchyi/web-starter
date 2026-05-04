# Responsive

Two breakpoints. That is the entire system.

## The breakpoints

| Token (reference) | Width | What flips |
| --- | --- | --- |
| `--bp-tablet` | **980px** | Multi-column grids halve · primary nav → hamburger · trust strips collapse · hero grid → single column · footer grid 5→2 |
| `--bp-mobile` | **720px** | Card grid 2→1 · forms stack full-width · header pill shrinks · h1 drops to small step · auxiliary CTAs hide · hero asides reset to plain stack |

CSS custom properties **cannot** live inside `@media` queries. The literal numbers MUST appear in `@media (max-width: 980px)` / `(max-width: 720px)`. Tokens in `tokens.css` are reference-only.

## The rules

1. **Two breakpoints only.** No `1024`, `768`, `600`, `480`, `375`. If a layout breaks between 720 and 980, fix the layout — don't add a third breakpoint.
2. **Desktop-first cascade.** The bare component CSS is the desktop layout; media queries override **downward** with `max-width`. Mobile-first (`min-width`) is not used. Pick one convention and stay with it.
3. **Design must hold from 1440px down to 360px** with no third breakpoint. If something cramps below 720, the fix is in the component (smaller padding, scale type, stack, hide secondary content) — not a new breakpoint.
4. **Each component owns its own media queries.** They live at the bottom of the component file under a `── Responsive ──` separator. Cross-component layout (container width, section vertical rhythm) is in `layout.css`.
5. **Container padding is 16px on mobile**, 24px desktop. The global `.container` handles this. Don't override.
6. **Stack offsets and decorative overlaps reset on mobile.** Cards that overlap with negative margins, asymmetric paddings, or hard-coded `margin-left/right` for "stack-card" looks must reset to `margin: 0; width: 100%` at `≤720`. No horizontal overflow.
7. **No horizontal scroll on `<body>`.** Ever. If a child causes overflow, fix the child. Don't slap `overflow-x: hidden` on body.
8. **Test 1280, 980, 820, 720, 390, 360.** Visual sweep at each width before calling responsive done.
9. **Hide, don't shrink-to-illegible.** Below 720, secondary content (extra ghost CTAs, decorative aside columns) should hide rather than become tiny. **Never hide critical features** — adapt the layout. Hide duplicates only.
10. **Forms span full width on mobile** (`grid-template-columns: 1fr`, button width 100%). No half-width inputs below 720.

## Mobile adaptation playbook

Apply these by default to any section work. Deviate only with reason.

### Spacing & containers

- **Side gutter is 16px globally on mobile.** `.container { padding: 0 16px }` at `@media (max-width: 720px)`. Don't let individual sections set their own horizontal padding — rely on `.container`. Override `padding-left/right` only if a section is full-bleed and needs custom edge logic.
- **Section vertical padding ≈ halved on mobile.** Block: `88 → 56`. Hero: `180 → 88`. CTA blocks: `100 → 44`. Tighten without crowding.
- **Internal card padding 10–16px on mobile.** Below 10 feels cramped. Stat cards 12/14, feed cards 10/16/10.
- **Reduce gaps proportionally.** List gap `36 → 28`, grid gap `44 → 24`, action gap `12 → 10`.

### Typography

- **H1 large display: 48 → 30px** on mobile. `line-height: 1.12`. Drop decorative `<br>` line breaks.
- **H2 mobile: 24px** drives most h2s. Override per-section if a CTA needs more drama (closing CTA can hold 30–36).
- **Subheads / leads drop one step.** `--fs-body (16) → --fs-sm (14)` in hero only. Body copy in content sections stays 16px.
- **Display metrics scale together.** Trust 30 → 26, live counters 28 → 22 in stat-grid contexts. Keep number/label proportions consistent across the same block.
- **Don't drop body below 14px.** `--fs-micro (12)` is the floor for sub-labels.

### Layout structure

- **Multi-column → single column.** Default `grid-template-columns: 1fr` on `(max-width: 720px)`. FAQ, how-it-works, hero, CTA — all use this rule.
- **Hide non-critical duplicates, don't strip critical features.** A live-card that duplicates a trust-strip metric can hide on mobile if another section carries the same signal. Never hide search / filter / primary CTAs — adapt them.
- **Floating overlays tuck inside parent bounds on mobile.** Desktop overhang (`bottom: -32px`) becomes flush inside (`bottom: 16px`).
- **Carousel mode for horizontal motion.** When a vertical stack feels heavy (e.g. a long activity feed), convert to a single-card carousel: `flex-direction: row`, `width: 100%`, slide-in from right. **Keep the per-card structure identical to desktop** — only the stack direction changes.

### Buttons & CTAs

- **CTA buttons stack full-width on mobile.** `flex-direction: column; align-items: stretch; .btn { width: 100% }`.
- **Search blocks stack vertically** with the submit button taking full width. Border-radius shifts from pill to `--radius-lg` so the inner button doesn't get clipped.
- **Header collapses to floating pill + hamburger.** Nav hidden, drawer opens full-screen with large nav links. User-icon button replaces "Sign in" text.

### Alignment

- **Hero: `text-align: center`** on mobile (single-block focal layout).
- **CTAs: center text** when single-column. Stack actions full-width below.
- **Body content / lists / cards: stay left-aligned.** Don't center FAQ details, item lists, session cards.
- **Critical: reset cascading `text-align` in nested components.** `section.hero { text-align: center }` will leak into `.activity-feed`, `.search-block`, `.live-card`. Explicitly set `text-align: left` inside those components on mobile so titles/sub stay flush-left.

### Stepper / list connectors

- **Vertical connector lines anchor to `<li>`, not the circle.** `position: absolute; top: <circle-height>px; bottom: calc(var(--gap) * -1); left: <circle-radius - line/2>px;`. Driving the height from the actual content + the gap variable means the line bridges every card no matter the description height.

### Image / glass / video

- **Background videos keep their poster fallback.** `<video poster="...">` with the poster declared so the section never goes blank during load.
- **Glass surfaces (`backdrop-filter: blur`) preserve internal proportions** — only outer padding tightens on mobile.
- **Avatar / icon sizes step down.** 48 → 44 → 40 → 36 → 34. Pick a size that keeps the rounded shape readable (≥30px).

### Common pitfalls

1. **`text-align` cascade.** Hero centers text; nested cards inherit and look broken. Always reset inside cards.
2. **Hardcoded fixed heights** for connector lines, stepper bars, fade-mask gradients — these break when content height varies. Drive heights from variables or `bottom: calc(-gap)` patterns.
3. **Blanket `display: none`** without scoping. `.live-card { display: none }` on mobile would also kill any other element using `.live-card`. Always scope: `.hero-aside .live-card { display: none }`.
4. **Forgetting that `.container` is loaded after the section's own padding.** Specificity tie → last loaded wins. If a section has its own `padding-left/right` override, remove it on mobile so `.container` handles the 16px gutter consistently.
5. **Right-edge fade masks** that darken important right-side content (price/CTA). Use masks only when there's meaningfully more content off-screen — not as decoration.
6. **Padding/font shifts that break vertical rhythm.** Proportional scaling: if a card shrinks 30%, gaps and font should too.

## Mobile checklist (run before calling responsive done)

- [ ] Container padding inherits 16px (no horizontal override unless full-bleed)
- [ ] Multi-column grid collapses to 1fr
- [ ] H1/H2 scaled (H1 ~30, H2 ~24); body 14–16
- [ ] Buttons in CTAs full-width + stacked
- [ ] Text alignment matches block intent (center for CTAs/hero, left for content lists)
- [ ] No cascading `text-align` from parent corrupting nested cards
- [ ] Floating absolute-positioned elements tucked inside bounds
- [ ] Connector lines / fade gradients driven by content vars, not fixed pixels
- [ ] No critical feature hidden — adapt instead
- [ ] Touch targets ≥40px (button heights, icon-only controls)
- [ ] No horizontal scroll on body at 360 / 390
