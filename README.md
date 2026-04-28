# yesmarket Claude Code Marketplace

A curated registry of Claude Code plugins published by [yesmarket](https://github.com/yesmarket).

## Available plugins

| Plugin | Description | Source |
|--------|-------------|--------|
| [speckit-extensions](#speckit-extensions) | Spec generation, validation, and templating for Claude Code | [yesmarket/speckit-extensions](https://github.com/yesmarket/speckit-extensions) |

---

### speckit-extensions

Extends Claude Code with spec-driven workflows — generate, validate, and template specs directly from your editor.

**Install into your project:**

```bash
# Using the marketplace installer
./scripts/install.sh speckit-extensions

# Or manually — add to your project's .mcp.json:
{
  "mcpServers": {
    "speckit-extensions": {
      "command": "npx",
      "args": ["-y", "@yesmarket/speckit-extensions"]
    }
  }
}
```

**Source:** https://github.com/yesmarket/speckit-extensions

---

## Usage

### List all plugins

```bash
./scripts/list.sh
# or as JSON:
./scripts/list.sh --json
```

### Install a plugin

```bash
./scripts/install.sh <plugin-id>
```

This writes the MCP server entry into `.mcp.json` in your current working directory. Restart Claude Code or run `/mcp refresh` to activate it.

## Contributing a plugin

1. Fork this repo.
2. Add `registry/plugins/<your-plugin-id>.json` following the [schema](.claude/CLAUDE.md).
3. Add an entry to `registry/index.json`.
4. Open a pull request.

## Registry API

The registry is plain JSON — consume it directly:

- **Index:** `registry/index.json`
- **Plugin manifest:** `registry/plugins/<id>.json`
