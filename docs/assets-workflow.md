# Воркфлоу для асетів

Де брати фото / іконки / шрифти, як оптимізувати, як уникнути типових помилок.

## Фотографії

### Якщо потрібно retina-якість (2K+)

Варіанти за пріоритетом:

1. **Imagen / Google AI Studio** (платно, найкраща якість): 16:9 → 2816×1536. Достатньо для full-bleed hero на 4K-моніторах.
2. **Midjourney v6+** (платно): 4K через `--ar 16:9 --quality 2`. Дуже добра стилізація, але треба правильно промптити.
3. **Stable Diffusion XL local** (безкоштовно): через ComfyUI або A1111. 1024×1024 нативно, через upscaler до 2K-4K.
4. **Стокові retina-фотобанки**: Unsplash (безкоштовно, 4K), Pexels (безкоштовно), Adobe Stock (платно). Шукай теги `4k`, `high-res`.

**Не використовуй на retina** генерацію 1024×1024 без upscale-у. На 2K-моніторі це виглядатиме розмитим.

### Стиль фото

Не плутай "генеричний стоковий стиль" із чистим стилем. Anti-slop момент: знімок як у "people working at laptop with smile" із розмитим bokeh — це слоп.

Проси:
- Конкретну композицію ("low-angle shot of hands on keyboard, side light, dark teal accent")
- Реальний контекст (не "person looks at screen", а "designer reviewing print proofs on studio table")
- Природне освітлення без штучних відблисків

### Оптимізація розміру

WebP замість JPG. Команда:

```bash
# одна команда (потрібен cwebp із пакета webp)
cwebp -q 82 input.jpg -o output.webp

# batch усієї папки
for f in *.jpg *.png; do
  cwebp -q 82 "$f" -o "${f%.*}.webp"
done
```

Quality 82 це хороший баланс. На 75 видно артефакти, на 90 файл занадто великий.

Перевір розмір: hero-фото має бути **< 300 KB**. Якщо більше — зменши quality або resize.

## Іконки

### Lucide (рекомендований дефолт)

Через CDN:

```html
<!-- у <head> -->
<script src="https://unpkg.com/lucide@latest"></script>

<!-- у HTML -->
<i data-lucide="search"></i>
<i data-lucide="user"></i>

<!-- у main.js -->
lucide.createIcons();
```

Каталог: <https://lucide.dev/icons>. Ліцензія MIT, безкоштовно для комерції.

Для production: self-host через npm (`npm install lucide` в окремому асет-репо), беси SVG-и в проект. Не залишай unpkg на проді — покладеш сайт, якщо CDN впаде.

### Heroicons / Tabler (альтернативи)

- <https://heroicons.com> — від Tailwind-команди. Outline + solid варіанти.
- <https://tabler.io/icons> — більший каталог, схожий стиль на Lucide.

### Streamline (платно)

Якщо потрібен pixel-perfect стиль і великий вибір. Підключення через API.

### Кастомні SVG-іконки

Збережи в `assets/icons/<name>.svg`. Підвантажуй через `<img>` або inline:

```html
<img src="assets/icons/logo.svg" alt="Logo" width="120" height="32">
```

Завжди задавай `width` і `height` явно. Без них браузер не може зарезервувати місце і станеться layout-shift.

### Не роби

- Не використовуй emoji як іконки в UI. Виглядає аматорськи на десктопі.
- Не змішуй стилі іконок із різних бібліотек на одній сторінці. Lucide + Heroicons разом виглядає хаотично.
- Не клади PNG-іконки замість SVG. SVG масштабується, важить менше.

## Шрифти

### Google Fonts (найпростіший варіант)

```html
<!-- у <head> ПЕРЕД tokens.css -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
```

Заміни сімейство і ваги на свої. Завжди постав `display=swap`, інакше FOIT (text invisible до loading).

**Не вантаж зайві ваги.** Кожна вага це окремий файл. Якщо в проекті є тільки 400 і 700, не клади 100/200/300/500/600/800/900.

### Self-host (production)

Скачай шрифти на <https://google-webfonts-helper.herokuapp.com> або через `npm` пакет. Поклади в `assets/fonts/`. Підключи через `@font-face` у `tokens.css` зверху:

```css
@font-face {
  font-family: 'Inter';
  src: url('../fonts/inter-variable.woff2') format('woff2');
  font-weight: 100 900;
  font-display: swap;
}
```

Variable font (`woff2-variations`) краще ніж 5 окремих ваг — один файл, плавна інтерполяція.

### Не роби

- Не використовуй TTF / OTF. Тільки WOFF2 для веба.
- Не вантаж шрифт після CSS. Шрифт перед CSS, інакше FOUT/FOIT-проблеми.
- Не використовуй Inter / Plus Jakarta / Geist як єдиний шрифт без display-pair. Це anti-slop патерн.

## Бекграундні відео

Hero-bg відео виглядає круто, але має пастки.

### Розмір файлу

Mp4 hero-bg має бути **< 5 MB**. Краще 2-3 MB. Інакше:
- Mobile-користувачі чекають 30+ секунд
- Mobile-провайдери блокують great videos
- Lighthouse score падає

Стиснення через FFmpeg:

```bash
ffmpeg -i input.mov \
  -vcodec libx264 \
  -crf 28 \
  -preset slow \
  -vf "scale=1920:-2" \
  -an \
  output.mp4
```

Параметри:
- `-crf 28` — quality (23 високо, 28 середньо, 33 видно артефакти). 28 хороший баланс.
- `-vf scale=1920:-2` — resize до Full HD. На retina все одно виглядає ОК завдяки motion.
- `-an` — без аудіо (hero-bg ніколи не мусить мати звук).
- `-preset slow` — кращий compression, повільніше кодує. Один раз вистачить.

### Markup

```html
<video
  class="hero-bg"
  autoplay
  muted
  loop
  playsinline
  poster="assets/hero-poster.webp">
  <source src="assets/hero-bg.mp4" type="video/mp4">
</video>
```

`poster` обовʼязково. Інакше до моменту loading hero буде чорний прямокутник.

`playsinline` обовʼязково. Без нього на iOS відео розгорнеться у fullscreen.

### Не роби

- Не клади відео без poster-у.
- Не використовуй autoplay без `muted`. Браузери заблокують.
- Не вантаж 30-секундне відео для 4-секундного loop-у. Виріж до коротшої тривалості.

## Іконки соцмереж і store-badges

App Store / Google Play / GitHub / Twitter — використовуй офіційні brand-assets, не самопальні:

- App Store: <https://developer.apple.com/app-store/marketing/guidelines/>
- Google Play: <https://play.google.com/intl/en_us/badges/>
- GitHub: <https://github.com/logos>

Кастомні SVG зі своїми кольорами офіційні бренди не дозволяють. Ризикуєш отримати листа від юристів.

## Контрольний чекліст перед шипом

- [ ] Усі фото в WebP, hero < 300 KB
- [ ] Іконки SVG, не PNG
- [ ] Шрифти WOFF2, тільки потрібні ваги, `display=swap`
- [ ] Bg-відео < 5 MB, із poster, із `playsinline`
- [ ] Усі `<img>` мають `width` і `height` атрибути (запобігає layout-shift)
- [ ] Великі асети (>500 KB) перевірені на reasonable стиснення
- [ ] Brand-assets соцмереж і store-badges — офіційні
