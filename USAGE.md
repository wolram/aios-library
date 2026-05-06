# AIOS — Guia de Uso

## Novo projeto — criar sem pausa

```bash
# 1. criar repo
gh repo create wolram/<projeto> --private --clone
cd <projeto>

# 2. carregar contexto global
/library use context-global
/library use context-priorities

# 3. carregar contexto do projeto (se existir)
/library use context-cltxpj      # ou context-mss, context-pena, etc.

# 4. carregar skills de trabalho
/library use skill-content-post  # conteúdo social

# 5. verificar recursos
/library use resource-manager
# → "qual o budget desse projeto?"
# → "qual auth está expirando?"
```

**Estrutura mínima de todo projeto novo:**
```
.claude/
  CLAUDE.md       ← instrui o agente: contexto, stack, regras
  settings.json   ← permissões, env vars, hooks
```

`CLAUDE.md` mínimo:
```markdown
# <Projeto>
Contexto: /library use context-<projeto>
Stack: <linguagem/framework>
Regra: respostas em PT-BR, sem filler
```

---

## Projeto existente — integrar AIOS

```bash
# Clonar library (uma vez por máquina)
git clone git@github.com:wolram/aios-library ~/.claude/skills/library

# Em qualquer sessão do projeto:
/library use context-global
/library use resource-manager

# Adicionar CLAUDE.md se não existir
/init   # gera CLAUDE.md a partir do estado atual do repo
```

Para adicionar contexto de projeto novo ao AIOS:
```bash
# Criar arquivo em aios-context
cd /tmp/aios-context   # ou clonar wolram/aios-context
echo "# Meu Projeto" > projects/meu-projeto.md
# preencher: produto, ICP, canais, KPIs, oferta
git add . && git commit -m "feat: add context meu-projeto" && git push

# Registrar no catálogo
# editar ~/.claude/skills/library/library.yaml — adicionar entry:
# - name: context-meu-projeto
#   description: ...
#   source: https://github.com/wolram/aios-context/blob/main/projects/meu-projeto.md
git -C ~/.claude/skills/library add library.yaml && git -C ~/.claude/skills/library commit -m "feat: add context-meu-projeto to catalog" && git -C ~/.claude/skills/library push
```

---

## Boas práticas

### Warp — Workflows

Salve os comandos AIOS mais usados como Workflows no Warp (`CMD+SHIFT+R`):

| Nome | Comando |
|------|---------|
| `aios-boot` | `cd ~/.claude/skills/library && git pull` |
| `aios-auth-check` | `gh auth status && vercel whoami` |
| `aios-context-push` | `cd /tmp/aios-context && git add . && git commit -m "update: context" && git push` |
| `aios-lib-push` | `cd ~/.claude/skills/library && git add library.yaml && git commit -m "feat: update catalog" && git push` |

### Warp — Notebooks

Use Notebooks do Warp para sessões de trabalho por projeto — cada notebook vira runbook vivo:

```
📓 cltxpj-sprint.md
  - /library use context-cltxpj
  - /library use skill-content-post
  - gh issue list --label "sprint"
  - vercel deploy --prod
```

### Warp — Env

Centralize vars sensíveis no Warp Env (não em `.env` commitado):

```
ANTHROPIC_API_KEY   → Warp Env: global
OPENAI_API_KEY      → Warp Env: global
LINEAR_API_KEY      → Warp Env: global
VERCEL_TOKEN        → Warp Env: global
```

No código, sempre `os.environ.get("VAR")` — nunca hardcode.

### Warp — Prompts (AI)

Salve prompts recorrentes como Warp AI Prompts:

- **"aios-boot"**: `Carrega contexto global + prioridades 90d. Use /library use context-global e context-priorities`
- **"ship-next"**: `Define a próxima entrega menor que move a métrica principal agora`
- **"content-batch"**: `Gera 5 posts para [projeto] com voz Marlow. Use context-global + skill-content-post`

### n8n — Workflow hygiene

- Cada workflow novo vai em `wolram/aios-automations` antes de ativar em produção
- Nomear: `[número]-[categoria]-[o-que-faz].json` (ex: `15-content-linkedin-carousel.json`)
- Depois de adicionar, atualizar `n8n/content/SKILL.md` com nova entrada na tabela

### Session hygiene

- `max_session_tokens: 50000` — sessão nova antes de atingir limite, não depois
- Sempre commitar contexto antes de fechar sessão longa (`/library use session-continuity`)
- Revalidação de auth só quando houver falha ou troca de ambiente

### Adicionando novo projeto ao AIOS (checklist)

- [ ] Criar `projects/<nome>.md` em `aios-context`
- [ ] Adicionar entry em `library.yaml`
- [ ] Adicionar `monthly_tokens` em `token-budgets.yaml`
- [ ] Adicionar `used_by` nas subscriptions relevantes em `subscriptions.yaml`
- [ ] Criar `CLAUDE.md` no repo do projeto
