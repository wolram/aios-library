# AIOS — founder stack, minimal by design

> A single catalog to create, register, and reuse skills without an extra review layer.

---

## Architecture

```
wolram/skills              ← active skills, agents, and scripts (source of truth)
wolram/aios-context        ← Marlow context: global + projects
wolram/aios-library        ← central catalog (/library)
wolram/aios-resources      ← accounts, subscriptions, token budgets, auth health
wolram/aios-automations    ← n8n workflows + macOS scripts + UiPath RPA
```

## Operational rule

- create first
- register after
- review only when there is a blocker, a divergence, or explicit validation

## Installation (once per machine)

```bash
git clone git@github.com:wolram/aios-library ~/.claude/skills/library
```

## Usage

```bash
# global context + priorities
/library use context-global
/library use context-priorities

# specific project context
/library use context-cltxpj
/library use context-mss
/library use context-pena
/library use context-construct-os
/library use context-tinderpromos

# operational skills
/library use skill-content-post      # IG/TikTok/X/Threads posts
/library use skill-seo-article       # SEO articles by persona
/library use skill-project-init      # spin up a new project with AIOS
/library use resource-manager        # costs, auth, token budgets

# review is optional, not a default step
/library use skill-weekly-audit      # only when explicitly needed
```

## Catalog

| Entry | Type | Source |
|-------|------|-------|
| `context-global` | context | aios-context/global/about_me.md |
| `context-priorities` | context | aios-context/global/priorities.md |
| `context-icp` | context | aios-context/global/icp.md |
| `context-cltxpj` | context | aios-context/projects/cltxpj.md |
| `context-mss` | context | aios-context/projects/mss-consultoria.md |
| `context-pena` | context | aios-context/projects/pena.md |
| `context-construct-os` | context | aios-context/projects/construct-os.md |
| `context-tinderpromos` | context | aios-context/projects/tinderpromos.md |
| `skill-content-post` | skill | wolram/skills/copywriting |
| `skill-seo-article` | skill | wolram/skills/web |
| `skill-weekly-audit` | skill | wolram/skills/strategy |
| `skill-project-init` | skill | wolram/skills/architecture |
| `conn-n8n-content` | automation | aios-automations/n8n/content |
| `conn-n8n-business` | automation | aios-automations/n8n/business |
| `conn-uipath` | automation | aios-automations/uipath/cep-validator |
| `skill-macos-automation` | automation | aios-automations/scripts/macos |
| `resource-manager` | resource | aios-resources/SKILL.md |

## Ecosystem repos

| Repo | Visibility | Content |
|------|-------------|----------|
| [aios-library](https://github.com/wolram/aios-library) | public fork | catalog + `/library` skill |
| [aios-context](https://github.com/wolram/aios-context) | private | global context + projects |
| [aios-resources](https://github.com/wolram/aios-resources) | private | cost, auth, and token YAMLs |
| [aios-automations](https://github.com/wolram/aios-automations) | private | n8n + scripts + UiPath |
| [skills](https://github.com/wolram/skills) | private | active skills and agents |

## Usage guide

See [USAGE.md](USAGE.md) for new project flow, existing project flow, and Warp tips.

## Stack & evolution

| Phase | Stack | Status |
|------|-------|--------|
| A | Shell + YAML + Markdown | **ativo** |

The stack does not need B/C layers to work day to day. The happy path is
`/library use`, `library.yaml`, and the already versioned context/skill files.

---

*Fork of [disler/the-library](https://github.com/disler/the-library) — adapted for the AIOS ecosystem.*
