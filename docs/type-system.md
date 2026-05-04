# Type system

Typography rules every project follows. The starter ships with `system-ui` as the body font — pick a real face on day 1 of a new project and update `--font-base`.

## Pick the font(s) on day 1

The starter does not ship an opinionated font choice. Two options:

1. **One family, multiple weights.** Cleanest. Make sure the family carries enough character at display sizes (e.g. Söhne, Saans, Recoleta, Geist Mono — but see anti-slop list).
2. **Two families, contrasting.** A neutral body face + a display face with personality. The display face is used for H1, H2 on dark blocks, and large metrics. The body face does everything else.

**Avoid the overused defaults**: Inter, Roboto, Geist, Fraunces, Plus Jakarta Sans, Space Grotesk. Using one of these is fine if it's a deliberate brand choice — but pair it with a contrasting display face so the design doesn't read as "generic AI template." See [anti-slop.md](anti-slop.md).

## Weight scale — only these five

```
--fw-regular:   400      /* body, captions, placeholders */
--fw-medium:    500      /* secondary body, link emphasis on dark */
--fw-semibold:  600      /* buttons, nav, chips, kicker accents under 13px */
--fw-bold:      700      /* h3, h4, labels, badges, prices */
--fw-display:   800      /* h1, dark-block h2, all display metrics */
```

No 300, no 900, no italic. If a design calls for "lighter," reduce size or color contrast — don't add 300.

## Tracking — follows size, not taste

Don't sprinkle `letter-spacing` per component. Use these tokens:

```
--ls-tight:    -0.02em     /* display, h1, h2 ≥28px */
--ls-snug:     -0.01em     /* card titles, prices */
--ls-base:      0          /* body */
--ls-wide:      0.04em     /* badges */
--ls-wider:     0.08em     /* field/footer/nav labels */
--ls-widest:    0.12em     /* section kicker / eyebrow */
```

Rule of thumb:

- ≥28px → `-0.02em`
- 16–22px headings → `-0.01em` or none
- Body → none
- Uppercase labels → positive tracking (the smaller the label, the wider the tracking)

## Leading — follows role, not taste

```
--lh-display:   1.08       /* h1 */
--lh-heading:   1.15       /* h2 */
--lh-tight:     1          /* display metrics — numbers sit on their own baseline */
--lh-card:      1.3        /* card / tile titles */
--lh-body:      1.5        /* body */
--lh-prose:     1.6        /* long-form: testimonial, FAQ, footer */
```

## Hard rules

1. **No new font families** without a deliberate decision. Pick the family in `tokens.css`, stick with it.
2. **No weights outside 400/500/600/700/800.**
3. **Tracking follows size**, not aesthetic preference. Use the tokens.
4. **Uppercase only for label tokens** (kicker, badge, footer-label, field-label). Never uppercase a heading or body line.
5. **Display numbers are 800.** Any prominent metric (counters, stats, prices over 24px) is 800 + tight tracking.
6. **One H1 per page.** Hero / page header only.
7. **Body never drops below 14px.** Below 14 is not body — it's a label or caption with its own role.
8. **Mobile sizing is two steps for H1, one step for H2.** E.g. 48 → 42 → 28 for H1; 38 → 26 for H2. Body stays 16, drops to 14 only in dense secondary contexts.

## Adding a new typography role

If a screen needs a style not in the tokens — e.g. a callout sub-headline that's bigger than `--fs-lead` but smaller than `--fs-h2`:

1. **Add the token to `tokens.css`** under the right group, with a comment naming the role.
2. **Use the new token** in the component.

Don't inline a one-off `font-size: 22px`. If it's worth using, it's worth a token.

## Reference table — example baseline

A reasonable starting set (extend per project). Sizes in px.

| Token | Desktop | ≤980 | ≤720 | Weight | Tracking | Leading |
| --- | --- | --- | --- | --- | --- | --- |
| `--fs-h1` | 48 | 42 | 30 | 800 | tight | display |
| `--fs-h2` | 38 | 32 | 24 | 700 | tight | heading |
| `--fs-h3` | 22 | — | 20 | 700 | snug | card |
| `--fs-h4` | 18 | — | — | 700 | none | card |
| `--fs-body` | 16 | — | — | 400 | none | body |
| `--fs-subhead` | 19 | — | 16 | 400 | none | body |
| `--fs-lead` | 16.5 | — | — | 400 | none | body |
| `--fs-sm` | 14 | — | — | 400/500/600 | none | body |
| `--fs-caption` | 13 | — | — | 400/500 | none | body |
| `--fs-micro` | 12 | — | — | 500/600 | wide | body |
| `--fs-kicker` | 12 | — | — | 700 | widest | tight |

Adjust per brand. Keep proportions: ≥1.25 ratio between adjacent display steps, body always 16, micro never below 12.
