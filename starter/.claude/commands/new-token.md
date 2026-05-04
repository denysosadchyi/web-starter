---
description: Додати новий design token у tokens.css за конвенцією
argument-hint: <ім'я> <значення> <category, опційно>
---

Додай новий design token у `assets/css/tokens.css`. Аргументи: `$ARGUMENTS`.

## Що зробити

1. Розпарси аргументи. Формат: `<ім'я> <значення> [<category>]`. Приклади:
   - `--fs-h2-md 32px font-size` — додати font-size 32px у групу "Display & headings"
   - `--brand-warn #f59e0b accent` — додати акцентний колір
   - `--space-52 52px spacing` — додати spacing-токен
2. Якщо category не передано, виведи її із префіксу:
   - `--fs-*` → font sizes
   - `--fw-*` → font weights
   - `--ls-*` → tracking
   - `--lh-*` → leading
   - `--space-*` → spacing
   - `--radius-*` → radii
   - `--shadow-*` → shadows
   - `--ink*`, `--bg*`, `--brand*`, `--accent-*` → colors
3. Знайди правильну секцію в `tokens.css` (за коментарями `/* ── ... ── */`). Встав токен у відповідне місце:
   - Spacing: за зростанням значення (`--space-50` між `--space-48` і `--space-56`)
   - Font sizes: за зростанням розміру у відповідній підгрупі (display / metrics / body / labels)
   - Кольори: групами (text / surfaces / borders / brand / accent)
4. Додай комент справа якщо токен має специфічне використання:
   ```css
   --space-340: 340px;          /* trainer-proof portrait height @720 */
   ```
5. Якщо це колір (`--*` що містить hex), додай також `*-rgb` варіант для alpha-композиції:
   ```css
   --brand-warn:     #f59e0b;
   --brand-warn-rgb: 245, 165, 11;
   ```

## Жорсткі правила

- **Імена в kebab-case з префіксом групи.** Не `--myColor`, а `--brand-secondary`.
- **Spacing pixel-named.** `--space-N` де N це значення в px. Якщо хочеш 22px — це `--space-22`, не `--space-tight-md`.
- **Не дублювати.** Перед додаванням ґрепни: `grep -n "$ARGUMENT_NAME" assets/css/tokens.css`. Якщо вже є — повідом і нічого не міняй.
- **Font weights тільки 400/500/600/700/800.** Не додавай 300, 900, italic.

## Коли закінчиш

Покажи 1-2 реченнями:
- Який токен додано і в яку секцію.
- Чи додано супутні (`*-rgb` для кольорів).
- Нагадай що токен поки **не використовується** — наступний крок це підставити його у відповідні компоненти.
