#!/usr/bin/env bash
# Install a plugin from the yesmarket Claude Code marketplace into the current project.
# Usage: ./scripts/install.sh <plugin-id>
# Example: ./scripts/install.sh speckit-extensions

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGISTRY="$SCRIPT_DIR/../registry"
MCP_CONFIG=".mcp.json"

usage() {
  echo "Usage: $0 <plugin-id>"
  echo ""
  echo "Available plugins:"
  list_plugins
  exit 1
}

list_plugins() {
  if command -v jq &>/dev/null; then
    jq -r '.plugins[] | "  \(.id)  —  \(.description)"' "$REGISTRY/index.json"
  else
    grep '"id"' "$REGISTRY/index.json" | sed 's/.*"id": "\(.*\)".*/  \1/'
  fi
}

install_plugin() {
  local plugin_id="$1"
  local manifest="$REGISTRY/plugins/${plugin_id}.json"

  if [[ ! -f "$manifest" ]]; then
    echo "Error: plugin '$plugin_id' not found in registry." >&2
    echo ""
    echo "Available plugins:"
    list_plugins
    exit 1
  fi

  if ! command -v jq &>/dev/null; then
    echo "Error: jq is required but not installed. Install it with your package manager." >&2
    exit 1
  fi

  local command
  local args_json
  command=$(jq -r '.installation.mcp_config.command' "$manifest")
  args_json=$(jq -c '.installation.mcp_config.args' "$manifest")

  # Read or initialise .mcp.json
  if [[ ! -f "$MCP_CONFIG" ]]; then
    echo '{"mcpServers":{}}' > "$MCP_CONFIG"
  fi

  # Merge the new server entry
  local tmp
  tmp=$(mktemp)
  jq --arg id "$plugin_id" \
     --arg cmd "$command" \
     --argjson args "$args_json" \
     '.mcpServers[$id] = {"command": $cmd, "args": $args}' \
     "$MCP_CONFIG" > "$tmp" && mv "$tmp" "$MCP_CONFIG"

  echo "Installed '$plugin_id' into $MCP_CONFIG."
  echo "Restart Claude Code (or run /mcp refresh) to activate it."
}

main() {
  if [[ $# -eq 0 ]]; then
    usage
  fi

  case "$1" in
    --list|-l) list_plugins ;;
    --help|-h) usage ;;
    *)         install_plugin "$1" ;;
  esac
}

main "$@"
