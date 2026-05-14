# web-starter

A ready-made site scaffold so a designer can quickly build a landing page (or any page) together with Claude Code, without ending up with the typical AI slop.

If you've never written code and are hearing the words "repository" or "terminal" for the first time: relax, everything below is step-by-step.

*Українська версія — [нижче](#web-starter-ua).*

## What it is, in plain words

This is a folder with:

- **A site scaffold.** HTML, CSS, JS are already written. Fonts, colors, spacing, mobile adaptation. Everything already works.
- **Rules for the AI.** When you ask Claude Code to build a new section, it automatically knows what NOT to do (purple gradients, glass cards, centering everything). And it always works to the project's conventions.
- **Instructions for you.** Where to get photos, how to write copy without AI phrases, how to put the site online.

## What you get

- The site works right away. Open the browser, see the page.
- The design looks clean, free of AI patterns.
- When you ask Claude Code to add something, the result will match the rest of the site, not be a "new component from a Tailwind tutorial".
- When it's ready, you put it online in 2 minutes (Netlify, Vercel or GitHub Pages).

## What you'll need

Just **Claude Code**: <https://claude.com/claude-code>

Everything else (git, python, local server) Claude will set up itself when you ask.

## How to start (5 minutes)

### Step 1. Create a folder for the project

Anywhere (desktop, Documents, wherever). Name it whatever you want, e.g. `my-site`.

### Step 2. Open this folder in Claude Code

Easiest via VS Code:

1. File → Open Folder, pick your new folder
2. Open Claude in the sidebar (Claude icon)

Or via the terminal:

```
cd path/to/my-site
claude
```

### Step 3. Drop Claude a link to this repo

Copy this into the Claude window:

```
Set up the project based on https://github.com/denysosadchyi/web-starter
Clone the starter, run a preview on localhost and open it for me in the browser.
```

Claude will do `git clone`, copy `starter/` into your folder, run a local server, give you the URL. All ready to work.

### What next

**Change the brand** in `starter/assets/css/tokens.css` (or just tell Claude: "change the primary color to #ff5722").

**Ask for sections via slash commands:**

- `/hero <project description>` adds a hero without slop
- `/component <name>` creates a new section following the convention
- `/audit-slop` checks the current code for AI patterns
- `/mobile-check` checks mobile adaptation
- `/new-token <name> <value>` adds a design token

## Where to read further

If you want to understand more broadly:

1. **`docs/00-start-here.md`**: detailed guide for the first 30 minutes. In Ukrainian. Read at least this one.
2. **`docs/anti-slop.md`**: list of AI patterns to avoid. Keep it handy on the first project.
3. **`docs/copy-rules.md`**: how to write copy without "leverage / unleash / in today's world". In Ukrainian.
4. **`docs/assets-workflow.md`**: where to get photos (Imagen, Unsplash), icons (Lucide), how to compress them. In Ukrainian.

Technical details (for a dev, if you ever want to hand it off for further work):

- `docs/architecture.md`: file structure, CSS conventions
- `docs/tokens.md`: token system
- `docs/type-system.md`: typography
- `docs/responsive.md`: mobile adaptation
- `docs/preview.md`: preview setup

## How to put the site online

When it's ready, there are three easy options. Details in `templates/README.md`.

**Easiest: Netlify**

1. Go to <https://app.netlify.com>
2. Sign up (you can use GitHub)
3. Drag the `starter/` folder into the window with your mouse
4. In 30 seconds you'll get a URL like `random-name.netlify.app`. You can link your own domain.

**If the project is already on GitHub: Vercel or GitHub Pages**

Configs are in the `templates/` folder. Copy the one you need into the project root, then follow the instructions in `templates/README.md`.

## What NOT to do

- Don't ask Claude "make a site like Stripe / Linear". You'll get a cheap copy with no character. Describe your function, and drive the look through tokens.
- Don't edit HTML by hand unless you're sure. Better describe to Claude what you need, and it will write it following the conventions.
- Don't add your own colors via `style="color: red"` in HTML. Everything goes through tokens in `tokens.css`. Otherwise the design will fall apart within a week.
- Don't drop 10 MB photos into the hero. Compress to WebP first (instructions in `docs/assets-workflow.md`).
- Don't use Inter / Roboto / Plus Jakarta Sans as the single font with no display pair. That's an AI marker. Details in anti-slop.

## If something isn't working

- **`git` command not found** → install git: <https://git-scm.com/downloads>
- **`python3` command not found** → install Python: <https://python.org/downloads>
- **Page doesn't open at localhost:8000** → check that the terminal is in the `starter/` folder and the server is running
- **CSS changes aren't picked up** → hard refresh the browser: Ctrl+Shift+R (Cmd+Shift+R on Mac)
- **Claude generates code that doesn't match the rest** → remind it: "check `CLAUDE.md`, I want the project's convention"

## Philosophy

- **No frameworks.** Plain HTML+CSS+JS. When you want to move to React, a dev will port it in an evening.
- **Tokens only.** Everything visual (colors, sizes, shadows) lives in one file. Want to change the brand: one file, the whole site updates.
- **Anti-slop by default.** The first version the AI produces is usually slop. Always ask "is this a choice, or a default?".
- **Two breakpoints. That's it.** Desktop, tablet (980), mobile (720). If it breaks, fix the component, don't add a third breakpoint.

## What it is not

- Not a UI component library. There are only examples here (header, footer, buttons, FAQ, form). Don't expect "a full design system with 200 components".
- Not a site builder like Wix. You need to understand a bit of HTML/CSS, or ask Claude.
- Not an SEO-optimized template. Basic semantics are in place, but meta tags, sitemap, schema.org you'll need to add yourself (Claude will help).

---

Questions, bugs, suggestions: <https://github.com/denysosadchyi/web-starter/issues>

---

<a id="web-starter-ua"></a>

# web-starter (UA)

Готовий каркас сайту, щоб дизайнер міг швидко зробити лендінг (або будь-яку сторінку) разом із Claude Code, не отримавши на виході типовий AI-слоп.

Якщо ти ніколи не писав код і чуєш слова "репозиторій" чи "термінал" вперше: спокійно, нижче все по кроках.

## Що це таке простими словами

Це папка з:

- **Заготовкою сайту.** HTML, CSS, JS уже написані. Шрифти, кольори, відступи, мобільна адаптація. Все вже працює.
- **Правилами для AI.** Коли просиш Claude Code зробити нову секцію, він автоматично знає, що НЕ можна робити (фіолетові градієнти, glass-картки, центрування всього). І завжди працює за конвенцією.
- **Інструкціями для тебе.** Де брати фото, як писати тексти без AI-фраз, як викласти сайт онлайн.

## Що ти отримуєш

- Сайт працює одразу. Відкриваєш браузер, бачиш сторінку.
- Дизайн виглядає чисто, без AI-патернів.
- Коли просиш Claude Code щось додати, результат буде в стилі решти сайту, не "новий компонент із Tailwind-туторіалу".
- Коли готово, викладаєш онлайн за 2 хвилини (Netlify, Vercel або GitHub Pages).

## Що тобі знадобиться

Тільки **Claude Code**: <https://claude.com/claude-code>

Все решта (git, python, локальний сервер) Claude налаштує сам, коли ти попросиш.

## Як почати (5 хвилин)

### Крок 1. Створи папку для проекту

В будь-якому місці (робочий стіл, Documents, що завгодно). Назви як хочеш, наприклад `my-site`.

### Крок 2. Відкрий цю папку в Claude Code

Найпростіше через VS Code:

1. File → Open Folder, обери свою нову папку
2. Відкрий Claude в сайдбарі (іконка Claude)

Або через термінал:

```
cd шлях/до/my-site
claude
```

### Крок 3. Скинь Claude посилання на цей репо

Скопіюй у вікно Claude:

```
Налаштуй проект на основі https://github.com/denysosadchyi/web-starter
Склонуй starter, запусти превʼю на localhost і відкрий мені браузером.
```

Claude зробить git clone, скопіює `starter/` у твою папку, запустить локальний сервер, дасть URL. Все готово до роботи.

### Що далі

**Зміни бренд** в `starter/assets/css/tokens.css` (або просто скажи Claude: "поміняй основний колір на #ff5722").

**Проси секції слеш-командами:**

- `/hero <опис проекту>` додає hero без слопу
- `/component <імʼя>` створює нову секцію за конвенцією
- `/audit-slop` перевіряє поточний код на AI-патерни
- `/mobile-check` перевіряє мобільну адаптацію
- `/new-token <імʼя> <значення>` додає design-токен

## Куди читати далі

Якщо хочеш зрозуміти ширше:

1. **`docs/00-start-here.md`**: детальна інструкція для перших 30 хвилин. Українською. Прочитай хоча б цей.
2. **`docs/anti-slop.md`**: список AI-патернів, яких уникаєш. Тримай під рукою при першому проекті.
3. **`docs/copy-rules.md`**: як писати тексти без "leverage / unleash / у сучасному світі". Українською.
4. **`docs/assets-workflow.md`**: де брати фото (Imagen, Unsplash), іконки (Lucide), як стиснути. Українською.

Технічні деталі (для дева, якщо хочеш передавати на доробку):

- `docs/architecture.md`: структура файлів, конвенції CSS
- `docs/tokens.md`: система токенів
- `docs/type-system.md`: типографіка
- `docs/responsive.md`: мобільна адаптація
- `docs/preview.md`: налаштування превʼю

## Як викласти сайт онлайн

Коли готовий, є три легкі варіанти. Деталі в `templates/README.md`.

**Найпростіший: Netlify**

1. Зайди на <https://app.netlify.com>
2. Зареєструйся (можна через GitHub)
3. Перетягни папку `starter/` мишкою у вікно
4. Через 30 секунд отримаєш URL виду `random-name.netlify.app`. Можеш привʼязати свій домен.

**Якщо проект уже на GitHub: Vercel або GitHub Pages**

Конфіги є в папці `templates/`. Скопіюй потрібний у корінь проекту, далі за інструкцією в `templates/README.md`.

## Що НЕ робити

- Не питай Claude "зроби сайт як у Stripe / Linear". Отримаєш дешеву копію без характеру. Опиши свою функцію, а вигляд керуй через токени.
- Не міняй HTML руками, якщо не впевнений. Краще опиши Claude що треба, він напише за конвенцією.
- Не додавай свої кольори через `style="color: red"` в HTML. Все через токени в `tokens.css`. Інакше через тиждень дизайн розвалиться.
- Не клади 10 МБ-фото в hero. Перед використанням стисни в WebP (інструкція в `docs/assets-workflow.md`).
- Не клади Inter / Roboto / Plus Jakarta Sans як єдиний шрифт без display-pair. Це AI-маркер. Деталі в anti-slop.

## Якщо щось не працює

- **Команда `git` не знайдена** → встанови git: <https://git-scm.com/downloads>
- **Команда `python3` не знайдена** → встанови Python: <https://python.org/downloads>
- **Сторінка не відкривається на localhost:8000** → перевір що термінал у папці `starter/` і що сервер запущений
- **Зміни в CSS не підхоплюються** → жорсткий рефреш браузера: Ctrl+Shift+R (Cmd+Shift+R на Mac)
- **Claude генерить код, який не схожий на решту** → нагадай йому: "перевір `CLAUDE.md`, я хочу за конвенцією проекту"

## Філософія

- **Без фреймворків.** Чистий HTML+CSS+JS. Коли захочеш перенести на React, дев перенесе за вечір.
- **Тільки токени.** Усе візуальне (кольори, розміри, тіні) живе в одному файлі. Захотів змінити бренд: один файл, увесь сайт оновився.
- **Anti-slop по дефолту.** Перший варіант, який видає AI, зазвичай слоп. Завжди питай "це вибір, чи дефолт?".
- **Два брейкпоінти. Все.** Десктоп, планшет (980), мобайл (720). Якщо ламається, виправляй компонент, не додавай третій брейкпоінт.

## Що це не таке

- Не бібліотека UI-компонентів. Тут є тільки приклади (header, footer, кнопки, FAQ, форма). Не очікуй "повної дизайн-системи на 200 компонентів".
- Не білдер сайтів типу Wix. Тут треба трошки розуміти HTML/CSS, або просити Claude.
- Не SEO-оптимізований шаблон. Базова семантика є, але мета-теги, sitemap, schema.org доведеться додати самому (Claude поможе).

---

Питання, баги, побажання: <https://github.com/denysosadchyi/web-starter/issues>
