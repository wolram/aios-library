# TinderPromos + JobApp — Sessão AIOS
> Afiliados · tinderdaspromos.com.br · jobapp.site · prioridade #5

---

## 1. Boot — guia do projeto

```bash
aios ctx
```

## 2. Navegar pros repos

```bash
cd ~/projects/03_DealsEngine_SideProject
git status

# JobApp
cd ~/projects/AppJob
git status
```

## 3. Carregar contexto no Claude

```bash
/library use context-global
/library use context-tinderpromos
```

## 4. Conteúdo — promoções do dia

```bash
/library use conn-n8n-content
# → workflow 11-tiktok-viral-agent ou 08-viral-instagram-reels
# input: promoções do dia com link afiliado
```

## 5. Calendário — próximas datas

```bash
# no Claude Code após carregar contexto:
# "próximas datas promocionais BR nos próximos 30 dias — gera calendário de posts"
```

## 6. Afiliados — checar performance

```bash
# acessar dashboard do programa de afiliados
open https://tinderdaspromos.com.br/admin
```

## 7. JobApp — landing e captura

```bash
cd ~/projects/AppJob
gh issue list
open https://jobapp.site
```

## 8. Auditoria semanal

```bash
/library use skill-weekly-audit
# → "auditoria TinderPromos: seguidores, cliques afiliado, receita/mês, engajamento"
```
