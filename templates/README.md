# Templates

Готові конфіги для деплою. Скопіюй потрібний у корінь твого проекту.

## Netlify

```bash
cp templates/netlify.toml ./
```

Потім підключи репо на <https://app.netlify.com/start> або зроби drag-and-drop папки `starter/`.

## Vercel

```bash
cp templates/vercel.json ./
```

Потім `vercel deploy` через CLI або підключи репо на <https://vercel.com/new>.

## GitHub Pages

```bash
mkdir -p .github/workflows
cp templates/github-pages.yml .github/workflows/pages.yml
```

Запушити, потім: **Repo Settings → Pages → Source: GitHub Actions**.

Після першого пуша воркфлоу запуститься автоматично. URL відображається у Settings → Pages.

## Який обрати

| | Безкоштовно | Custom domain | Auto-deploy on push | Складність |
| --- | --- | --- | --- | --- |
| **Netlify** | ✓ | ✓ | ✓ | мінімум |
| **Vercel** | ✓ | ✓ | ✓ | мінімум |
| **GitHub Pages** | ✓ | ✓ | ✓ (через workflow) | трохи більше setup |

Для першого проекту бери **Netlify** — drag-and-drop працює без репо. Для постійного workflow з GitHub — Pages або Vercel.
