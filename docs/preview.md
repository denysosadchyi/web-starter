# Preview

The starter has no build step. Any static server works.

## Quickest — Python

```bash
cd starter
python3 -m http.server 8000
```

Open <http://localhost:8000>.

## Node alternative

```bash
npx serve starter -l 8000
```

## Live reload

If you want auto-reload on file save:

```bash
npx live-server starter --port=8000 --no-browser
```

Or use the VS Code "Live Server" extension — right-click `index.html` → Open with Live Server.

## LAN preview (test on your phone)

Find your machine's IP:

```bash
# Linux / macOS
ip addr show | grep "inet " | grep -v 127.0.0.1
# or
hostname -I

# macOS
ipconfig getifaddr en0
```

Then start the server bound to all interfaces:

```bash
python3 -m http.server 8000 --bind 0.0.0.0
```

On your phone (same Wi-Fi): `http://<your-ip>:8000`.

## Cache busting during dev

Browsers aggressively cache CSS. If a change isn't showing, hard-reload:

- Chrome / Firefox: `Cmd/Ctrl + Shift + R`
- Or DevTools → Network → "Disable cache" (only while DevTools is open)

For long sessions, append a query string to your `<link>` tags during dev:

```html
<link rel="stylesheet" href="assets/css/tokens.css?v=2">
```

Strip the query before shipping.

## Production deploy

Static hosts work out of the box:

- **GitHub Pages**: push `starter/` to a repo, enable Pages on `/` of `main` (or `gh-pages` branch)
- **Netlify / Vercel**: drag-and-drop the `starter/` folder, or connect a repo and set publish directory to `starter`
- **Cloudflare Pages**: same — connect repo, build command empty, output dir `starter`
- **Any S3 / object storage**: upload, point to `index.html`

No environment variables, no SSR, no edge functions. If a project grows to need any of these, it's outgrown the vanilla starter.
