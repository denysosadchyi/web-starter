#!/usr/bin/env bash
# lint-tokens.sh — find hardcoded design values that should be tokens
# Usage: ./scripts/lint-tokens.sh [css_path] [html_path]
# Defaults: starter/assets/css/components/  +  starter/

set -euo pipefail

CSS_TARGET="${1:-starter/assets/css/components}"
HTML_TARGET="${2:-starter}"

if [ ! -d "$CSS_TARGET" ]; then
  echo "Directory not found: $CSS_TARGET"
  exit 2
fi

echo "Linting $CSS_TARGET (css) + $HTML_TARGET (html)..."
echo

EXIT=0

# 1. Hardcoded hex colors in CSS (skip block comments header)
HEX_HITS=$(grep -nE '#[0-9a-fA-F]{3,8}\b' "$CSS_TARGET"/*.css | grep -vE ':\s*[0-9]+:\s*\*' || true)
if [ -n "$HEX_HITS" ]; then
  echo "❌ Hardcoded hex colors (use tokens instead):"
  echo "$HEX_HITS" | sed 's/^/   /'
  echo
  EXIT=1
fi

# 2. Hardcoded numeric rgb()/rgba() — but allow rgba(var(...))
RGB_HITS=$(grep -nE 'rgba?\(\s*[0-9]' "$CSS_TARGET"/*.css || true)
if [ -n "$RGB_HITS" ]; then
  echo "❌ Hardcoded rgb()/rgba() (use rgba(var(--token-rgb), .X) instead):"
  echo "$RGB_HITS" | sed 's/^/   /'
  echo
  EXIT=1
fi

# 3. Hardcoded font sizes (px values in font-size declarations) — but allow var()
FS_HITS=$(grep -nE 'font-size:\s*[0-9]+(\.[0-9]+)?px' "$CSS_TARGET"/*.css || true)
if [ -n "$FS_HITS" ]; then
  echo "❌ Hardcoded font-size px (use --fs-* token):"
  echo "$FS_HITS" | sed 's/^/   /'
  echo
  EXIT=1
fi

# 4. Hardcoded font weights as numbers (use --fw-* tokens)
FW_HITS=$(grep -nE 'font-weight:\s*[0-9]+\b' "$CSS_TARGET"/*.css || true)
if [ -n "$FW_HITS" ]; then
  echo "❌ Hardcoded font-weight (use --fw-* token):"
  echo "$FW_HITS" | sed 's/^/   /'
  echo
  EXIT=1
fi

# 5. Inline box-shadow without token — warn only.
#    Allow var(--shadow-*) and rgba(var(--*-rgb)) (semantic focus rings).
SHADOW_HITS=$(grep -nE 'box-shadow:\s*[^v;]' "$CSS_TARGET"/*.css \
  | grep -vE 'inherit|none|initial|var\(--shadow|rgba\(var\(--' || true)
if [ -n "$SHADOW_HITS" ]; then
  echo "⚠️  Inline box-shadow without --shadow-* token:"
  echo "$SHADOW_HITS" | sed 's/^/   /'
  echo
fi

# 6. Em-dash (—) in HTML user-facing copy. Skip HTML comments (<!-- ... -->).
if [ -d "$HTML_TARGET" ]; then
  EMDASH_HITS=$(grep -rn '—' "$HTML_TARGET" --include='*.html' 2>/dev/null \
    | grep -vE '<!--.*—.*-->' || true)
  if [ -n "$EMDASH_HITS" ]; then
    echo "❌ Em-dash (—) in HTML copy — AI-marker, replace with period/comma/colon:"
    echo "$EMDASH_HITS" | sed 's/^/   /'
    echo
    EXIT=1
  fi
fi

# Summary
if [ $EXIT -eq 0 ]; then
  echo "✓ Clean. No hardcoded values, no em-dashes in copy."
else
  echo "Fix the above before committing."
  echo "Add tokens to assets/css/tokens.css and reference them."
fi

exit $EXIT
