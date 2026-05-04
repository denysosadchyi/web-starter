---
description: Пройтись чеклістом мобільної адаптації по поточному коду
---

Запусти повний чекліст мобільної адаптації на цьому проекті. Повний плейбук у `docs/responsive.md`.

## Що перевірити

Для кожного пункту нижче: пройдися по `assets/css/components/*.css` і `index.html`, знайди порушення (якщо є), вкажи файл і селектор.

### Контейнери та spacing

- [ ] `.container` має `padding: 0 16px` на мобайлі (`@media (max-width: 720px)`)
- [ ] Жодна секція не задає свого горизонтального padding-у через `padding-left/right` на мобайлі (повинна покладатись на `.container`)
- [ ] Section vertical padding халвиться на мобайлі (приклад: `block 88 → 56`)
- [ ] Internal card padding 10-16px на мобайлі (не нижче 10)
- [ ] Грід-gap-и зменшуються proportionally (24+ → 16-20)

### Типографіка

- [ ] H1 має mobile-override до `--fs-h1-sm` (~30px)
- [ ] H2 має mobile-override до `--fs-h2-sm` (~24px)
- [ ] Body не падає нижче 14px ніде
- [ ] Display-метрики (≥24px desktop) масштабуються разом із label, не окремо

### Layout

- [ ] Multi-column grids колапсають у `grid-template-columns: 1fr` на ≤720
- [ ] Hero / aside grid → одна колонка
- [ ] Floating absolutely-positioned елементи тискаються всередину parent-bounds (`bottom/left/right: 16px`, не overhang)
- [ ] Cards з overlap (`margin-top: -32px`) ресетяться: `margin: 0; width: 100%`

### Кнопки та CTA

- [ ] CTA-блоки стекаються `flex-direction: column; align-items: stretch; .btn { width: 100% }` на ≤720
- [ ] Search-block (якщо є) стек із full-width submit на мобайлі
- [ ] Header колапсує в pill + hamburger drawer на мобайлі

### Alignment

- [ ] Hero має `text-align: center` на мобайлі
- [ ] CTA-секції центровані на мобайлі (text + actions stack)
- [ ] Body content / lists / cards залишаються `text-align: left`
- [ ] **Cascading text-align ресетнутий** всередині nested cards (hero-center не корумпує внутрішні картки)

### Stepper / connectors / fade-masks

- [ ] Vertical connector lines anchor to `<li>`, не до круга, з `bottom: calc(var(--gap) * -1)`
- [ ] Fade-masks driven by content vars, не fixed px

### Видимість і scope

- [ ] Жодна критична фіча не схована (`display: none`) на мобайлі (search, filters, primary CTA)
- [ ] Видимі тільки duplicates (наприклад, hero `.live-card` що повторює trust-strip метрику)
- [ ] `display: none` правила завжди scoped (`.hero-aside .live-card`, не голий `.live-card`)

### Touch i a11y

- [ ] Touch targets ≥40px (button heights, icon-only controls)
- [ ] Labels на icon-only buttons (`aria-label`)

### Overflow

- [ ] Body не має `overflow-x: hidden` (якщо є — це симптом, не fix; знайди дитину що оверфлоує)
- [ ] Жодного horizontal scroll на 360 / 390 в реальному превʼю

## Як вивести результат

```
## Mobile-check

### Порушень: N

1. **<файл>:<селектор>** — <що порушено>
   Fix: <одне речення>

2. ...

### Чисто

- <які пункти OK і чому>

### Untestable from code alone

- <що треба перевірити вручну в браузері: horizontal scroll на 390, touch-target heights тощо>
```

Не правь автоматично. Дай список, користувач сам вирішить що міняти.
