# yesmarket Claude Code Marketplace

This repo is the plugin registry for the yesmarket Claude Code marketplace.

## Structure

```
registry/
  index.json              # Master index of all plugins
  plugins/<id>.json       # Full manifest for each plugin
scripts/
  install.sh              # Install a plugin into a project
  list.sh                 # List all available plugins
```

## Adding a plugin

1. Create `registry/plugins/<plugin-id>.json` following the schema in an existing manifest.
2. Add an entry to `registry/index.json` under `plugins[]`.

## Plugin manifest schema

| Field | Description |
|---|---|
| `id` | Unique slug (kebab-case) |
| `name` | Display name |
| `publisher` | GitHub org or user |
| `description` | One-sentence description |
| `version` | Semver or `"latest"` |
| `source.type` | `"github"` |
| `source.repo` | `"org/repo"` |
| `installation.mcp_config` | MCP server config merged into `.mcp.json` |
| `tags` | Array of keyword strings |
| `category` | One of: `productivity`, `testing`, `devops`, `ai`, `data` |
