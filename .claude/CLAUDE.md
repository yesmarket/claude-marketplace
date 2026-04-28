# Claude Code Marketplace

This repo is a plugin registry for Claude Code.

## Structure

```
registry/
  index.json              # Master index of all plugins
```

## Adding a plugin

Add an entry to `registry/index.json` under `plugins[]`. The plugin's own GitHub repo is the source of truth for its full manifest.

## Index entry schema

| Field | Description |
|---|---|
| `id` | Unique slug (kebab-case) |
| `name` | Display name |
| `publisher` | GitHub org or user |
| `description` | One-sentence description |
| `version` | Semver or `"latest"` |
| `source.type` | `"github"` |
| `source.repo` | `"org/repo"` |
| `tags` | Array of keyword strings |
| `category` | One of: `productivity`, `testing`, `devops`, `ai`, `data` |
