# AIOS — AI Operating System

> Catálogo central de skills, contexto e automações para 17 projetos simultâneos.  
> Qualquer projeto herda 39+ skills, 24 workflows e contexto completo com 2 comandos.

[![Last Commit](https://img.shields.io/github/last-commit/wolram/aios-library?color=black&label=atualizado)](https://github.com/wolram/aios-library/commits/main)
[![Skills](https://img.shields.io/badge/skills-39-6366f1)](https://github.com/wolram/skills)
[![Workflows](https://img.shields.io/badge/workflows-24-f59e0b)](https://github.com/wolram/aios-automations)
[![Projects](https://img.shields.io/badge/projetos-17-10b981)](https://github.com/wolram/aios-context)
[![Catalog](https://img.shields.io/badge/catalog-17_entries-3b82f6)](https://github.com/wolram/aios-library/blob/main/library.yaml)
[![License](https://img.shields.io/github/license/wolram/aios-library?color=gray)](LICENSE)

---

## Arquitetura

```
wolram/aios-library        ← este repo — catálogo central (/library slash command)
wolram/aios-context        ← contexto Marlow: global + 5 projetos prioritários
wolram/aios-resources      ← accounts, subscriptions, token budgets, auth health
wolram/aios-automations    ← 24 workflows n8n + 5 scripts macOS + UiPath RPA
wolram/skills              ← 39 skills/agents ativos (fonte da verdade)
```

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
/library use skill-weekly-audit      # auditoria semanal de projeto
/library use skill-project-init      # spin up novo projeto com AIOS

# automações
/library use conn-n8n-content        # 14 workflows de conteúdo
/library use conn-n8n-business       # 10 workflows de processo
/library use conn-uipath             # RPA BR — CEP validator
/library use skill-macos-automation  # scripts Python macOS

# recursos e limites
/library use resource-manager        # custos, auth, token budgets
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
| [skills](https://github.com/wolram/skills) | privado | 39 skills/agents ativos |

## Guia de uso

Ver [USAGE.md](USAGE.md) — novo projeto, projeto existente, boas práticas Warp.

## Stack & evolução

| Fase | Stack | Status |
|------|-------|--------|
| A | Shell + YAML + Markdown | **ativo** |
| B | Rust CLI `aios` | semana 2 — se YAML ficar complexo |
| C | LangGraph | mês 2 — cadência autônoma, pipelines multi-agente |

Fases sequencialmente dependentes: B lê schema de A, C consome catálogo de A.

---

*Fork de [disler/the-library](https://github.com/disler/the-library) — adaptado para o ecossistema AIOS.*
