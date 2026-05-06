# AIOS — Usage Guide

## New project — create without pause

```bash
# 1. create repo
gh repo create wolram/<projeto> --private --clone
cd <projeto>

# 2. load global context
/library use context-global
/library use context-priorities

# 3. load project context (if it exists)
/library use context-cltxpj      # ou context-mss, context-pena, etc.

# 4. load working skills
/library use skill-content-post  # social content

# 5. check resources
/library use resource-manager
# → "what is this project's budget?"
# → "which auth is expiring?"
```

**Minimum structure for every new project:**
```
.claude/
  CLAUDE.md       ← instructs the agent: context, stack, rules
  settings.json   ← permissions, env vars, hooks
```

`CLAUDE.md` minimum:
```markdown
# <Projeto>
Context: /library use context-<projeto>
Stack: <language/framework>
Rule: responses in English, no filler
```

---

## Existing project — integrate AIOS

```bash
# Clone the library (once per machine)
git clone git@github.com:wolram/aios-library ~/.claude/skills/library

# In any project session:
/library use context-global
/library use resource-manager

# Add CLAUDE.md if it does not exist
/init   # generates CLAUDE.md from the repo's current state
```

To add a new project context to AIOS:
```bash
# Create the file in aios-context
cd /tmp/aios-context   # ou clonar wolram/aios-context
echo "# My Project" > projects/my-project.md
# fill in: product, ICP, channels, KPIs, offer
git add . && git commit -m "feat: add context my-project" && git push

# Register it in the catalog
# edit ~/.claude/skills/library/library.yaml — add entry:
# - name: context-my-project
#   description: ...
#   source: https://github.com/wolram/aios-context/blob/main/projects/my-project.md
git -C ~/.claude/skills/library add library.yaml && git -C ~/.claude/skills/library commit -m "feat: add context-my-project to catalog" && git -C ~/.claude/skills/library push
```

---

## Best practices

### Warp — Workflows

Save the most common AIOS commands as Warp Workflows (`CMD+SHIFT+R`):

| Name | Command |
|------|---------|
| `aios-boot` | `cd ~/.claude/skills/library && git pull` |
| `aios-auth-check` | `gh auth status && vercel whoami` |
| `aios-context-push` | `cd /tmp/aios-context && git add . && git commit -m "update: context" && git push` |
| `aios-lib-push` | `cd ~/.claude/skills/library && git add library.yaml && git commit -m "feat: update catalog" && git push` |

### Warp — Notebooks

Use Warp Notebooks for project sessions. Each notebook becomes a living runbook:

```
📓 cltxpj-sprint.md
  - /library use context-cltxpj
  - /library use skill-content-post
  - gh issue list --label "sprint"
  - vercel deploy --prod
```

### Warp — Env

Centralize sensitive vars in Warp Env, not in a committed `.env`:

```
ANTHROPIC_API_KEY   → Warp Env: global
OPENAI_API_KEY      → Warp Env: global
LINEAR_API_KEY      → Warp Env: global
VERCEL_TOKEN        → Warp Env: global
```

In code, always use `os.environ.get("VAR")` — never hardcode.

### Warp — Prompts (AI)

Save recurring prompts as Warp AI Prompts:

- **"aios-boot"**: `Load global context + 90d priorities. Use /library use context-global and context-priorities`
- **"ship-next"**: `Define the next smallest delivery that moves the main metric now`
- **"content-batch"**: `Generate 5 posts for [project] in Marlow's voice. Use context-global + skill-content-post`

### n8n — Workflow hygiene

- Put every new workflow in `wolram/aios-automations` before enabling it in production
- Name it as `[number]-[category]-[what-it-does].json` (example: `15-content-linkedin-carousel.json`)
- After adding it, update `n8n/content/SKILL.md` with a new table entry

### Session hygiene

- `max_session_tokens: 50000` — start a new session before hitting the limit, not after
- Always commit context before closing a long session (`/library use session-continuity`)
- Revalidate auth only when there is a failure or an environment change

### Adding a new project to AIOS (checklist)

- [ ] Create `projects/<name>.md` in `aios-context`
- [ ] Add an entry to `library.yaml`
- [ ] Add `monthly_tokens` to `token-budgets.yaml`
- [ ] Add `used_by` in the relevant subscriptions in `subscriptions.yaml`
- [ ] Create `CLAUDE.md` in the project repo
