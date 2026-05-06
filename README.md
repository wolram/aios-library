# AIOS — stack mínima do founder

> Catálogo único para criar, registrar e reutilizar skills sem camada extra de review.

---

## Arquitetura

```
wolram/skills              ← skills, agents e scripts ativos (fonte da verdade)
wolram/aios-context        ← contexto Marlow: global + projetos
wolram/aios-library        ← catálogo central (/library)
wolram/aios-resources      ← accounts, subscriptions, token budgets, auth health
wolram/aios-automations    ← workflows n8n + scripts macOS + UiPath RPA
```

## Regra operacional

- cria primeiro
- registra depois
- revisa só quando houver bloqueio, divergência ou validação explícita

## Instalação (uma vez por máquina)

```bash
git clone git@github.com:wolram/aios-library ~/.claude/skills/library
```

## Uso

```bash
# contexto global + prioridades
/library use context-global
/library use context-priorities

# contexto de projeto específico
/library use context-cltxpj
/library use context-mss
/library use context-pena
/library use context-construct-os
/library use context-tinderpromos

# skills operacionais
/library use skill-content-post      # posts IG/TikTok/X/Threads
/library use skill-seo-article       # artigos SEO por persona
/library use skill-project-init      # spin up novo projeto com AIOS
/library use resource-manager        # custos, auth, token budgets

# revisão é opcional, não etapa padrão
/library use skill-weekly-audit      # só quando houver necessidade explícita
```

## Catálogo

| Entry | Tipo | Fonte |
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

## Repos do ecossistema

| Repo | Visibilidade | Conteúdo |
|------|-------------|----------|
| [aios-library](https://github.com/wolram/aios-library) | público (fork) | catálogo + `/library` skill |
| [aios-context](https://github.com/wolram/aios-context) | privado | contexto global + projetos |
| [aios-resources](https://github.com/wolram/aios-resources) | privado | YAMLs de custo, auth, tokens |
| [aios-automations](https://github.com/wolram/aios-automations) | privado | n8n + scripts + UiPath |
| [skills](https://github.com/wolram/skills) | privado | skills/agents ativos |

## Guia de uso

Ver [USAGE.md](USAGE.md) — novo projeto, projeto existente, boas práticas Warp.

## Stack & evolução

| Fase | Stack | Status |
|------|-------|--------|
| A | Shell + YAML + Markdown | **ativo** |

O stack não precisa de camada B/C para funcionar no dia a dia. O caminho feliz é
`/library use`, `library.yaml` e os arquivos de contexto/skills já versionados.

---

*Fork de [disler/the-library](https://github.com/disler/the-library) — adaptado para o ecossistema AIOS.*
