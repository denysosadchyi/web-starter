---
description: Згенерувати hero-секцію без AI-слопу
argument-hint: <короткий опис проекту, наприклад "fitness booking marketplace">
---

Збудуй hero-секцію для сайту. Контекст: $ARGUMENTS.

## Жорсткі заборони (anti-slop, NOT NEGOTIABLE)

- **БЕЗ** "великий метрик + 3 supporting stats". Це #1 AI-hero шаблон.
- **БЕЗ** glassmorphism / blur panels як декорації.
- **БЕЗ** тонкого акцентного бордера збоку card.
- **БЕЗ** gradient text на H1.
- **БЕЗ** purple/violet або cyan-on-dark градієнтів.
- **БЕЗ** icon-tile стек над заголовком.
- **БЕЗ** all-caps body.
- **БЕЗ** "dive deep", "leverage", "unleash", "elevate", em-dash у копірайті.

## Що мусить бути

- **Один H1.** Жирний (800), tight tracking (-0.02em), display leading (1.08). Без декоративних `<br>` на мобайлі.
- **Один subhead** (16-19px, regular, max-width ~54ch).
- **CTA блок:** одна primary-кнопка + одне secondary-посилання (ghost/link). Не дві primary.
- **Опційно:** один підтвердний рядок під CTA (соціал-пруф, рейтинг, "no credit card needed" — щось одне, не три).
- **Візуальний компонент:** одне фото (full-bleed або асиметричне, не центральне в рамці), або відео-фон із poster-фолбеком, або абстрактна форма. **Не stock-illustration з градієнтом.**

## Структура

```html
<section class="hero">
  <div class="container hero-grid">
    <div class="hero-copy">
      <p class="kicker">{{ optional eyebrow }}</p>
      <h1>{{ один чіткий value-prop, не два }}</h1>
      <p class="subhead">{{ один рядок, що пояснює як саме }}</p>
      <div class="hero-actions">
        <a class="btn btn-primary btn-lg" href="#">{{ Primary CTA }}</a>
        <a class="btn btn-link" href="#">{{ Secondary }}</a>
      </div>
      <p class="hero-proof">{{ опційно, один рядок }}</p>
    </div>
    <div class="hero-media">
      <!-- одне фото / відео / форма — не три -->
    </div>
  </div>
</section>
```

## Адаптив (mobile ≤720px)

- Сітка → одна колонка, copy спочатку, media після.
- `text-align: center` для блоку copy.
- H1 30px, subhead 16px.
- CTA-кнопки: `flex-direction: column`, `width: 100%`. Primary зверху, link під ним.
- Hero vertical padding: 180 → 88.

## Що зробити

1. Створи `assets/css/components/hero.css` за конвенцією компонента (template є в `/component`).
2. Постав HTML hero у `index.html` як перший `<section>` після `<header>`.
3. Перевір що використано тільки токени.
4. Запусти превʼю на 1280 і 720 — переконайся що нема горизонтального скролу і CTA full-width на мобайлі.

## Коли закінчиш

Покажи короткий summary: який H1 / subhead / CTA-копірайт використав, які токени дотягнув новими, як виглядає мобайл.
