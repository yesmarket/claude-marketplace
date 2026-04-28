# Claude Code Marketplace

This repo is a plugin registry for Claude Code.

## Structure

```
.claude-plugin/
  marketplace.json        # Master index of all plugins
```

## Adding a plugin

Add an entry to `.claude-plugin/marketplace.json` under `plugins[]`. The plugin's own GitHub repo is the source of truth for its full manifest.

## Plugin entry schema

| Field | Description |
|---|---|
| `name` | Unique kebab-case slug |
| `description` | One-sentence description |
| `author.name` | Author display name |
| `category` | e.g. `productivity`, `development`, `security` |
| `source.source` | `"url"` for a standalone repo, `"git-subdir"` for a subdir |
| `source.url` | Git clone URL |
| `source.path` | Subdir path (only for `git-subdir`) |
| `source.ref` | Branch or tag (only for `git-subdir`) |
| `homepage` | Link to plugin docs or repo |
