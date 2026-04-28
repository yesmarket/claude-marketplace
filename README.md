# Claude Code Marketplace

A plugin registry for Claude Code.

## Available plugins

| Plugin | Description | Source |
|--------|-------------|--------|
| [speckit-extensions](#speckit-extensions) | Custom skills for AI-assisted spec-driven development with speckit | [yesmarket/speckit-extensions](https://github.com/yesmarket/speckit-extensions) |

---

### speckit-extensions

Configures MCP servers, plugins, and skills for an AI-assisted spec-driven development workflow. Includes context-gathering skills that query external systems like Jira, Confluence, Figma, and others to drive wrapped speckit commands — e.g. `specify-from-jira` pulls a Jira ticket via the Atlassian MCP server and pipes it into `speckit specify` to produce a spec.

**Install:**

```bash
claude plugin marketplace add speckit-extensions
```

**Source:** https://github.com/yesmarket/speckit-extensions

---

## Usage

```bash
# Add a plugin
claude plugin marketplace add <plugin-id>

# List available plugins
claude plugin marketplace list

# Remove a plugin
claude plugin marketplace remove <plugin-id>
```

## Contributing a plugin

1. Fork this repo.
2. Add an entry to `registry/index.json` pointing at your GitHub repo.
3. Open a pull request.

## Registry API

The registry is plain JSON — consume it directly:

- **Index:** `registry/index.json`
