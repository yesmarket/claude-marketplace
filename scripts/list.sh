#!/usr/bin/env bash
# List all plugins in the yesmarket Claude Code marketplace.
# Usage: ./scripts/list.sh [--json]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGISTRY="$SCRIPT_DIR/../registry"

if [[ "${1:-}" == "--json" ]]; then
  cat "$REGISTRY/index.json"
  exit 0
fi

if ! command -v jq &>/dev/null; then
  grep '"id"\|"description"' "$REGISTRY/index.json"
  exit 0
fi

echo "yesmarket Claude Code Marketplace"
echo "=================================="
echo ""
jq -r '
  .plugins[] |
  "Plugin:      \(.id)",
  "Publisher:   \(.publisher)",
  "Category:    \(.category)",
  "Description: \(.description)",
  "Source:      \(.source.url)",
  "Tags:        \(.tags | join(", "))",
  ""
' "$REGISTRY/index.json"
