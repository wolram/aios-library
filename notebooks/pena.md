# Pena — Sessão AIOS
> OAB com IA · pena.click · simulados adaptativos · prioridade #3

---

## 1. Boot — guia do projeto

```bash
aios ctx
```

## 2. Navegar pro repo

```bash
cd ~/projects/penaclick
git status
gh issue list --label sprint
```

## 3. Carregar contexto no Claude

```bash
/library use context-global
/library use context-pena
```

## 4. Verificar deploy

```bash
vercel ls | grep pena
gh run list --limit 5
```

## 5. Conteúdo — dicas OAB (IG/TikTok)

```bash
/library use skill-content-post
# → "gera 5 posts OAB: dicas rápidas, trechos de simulado, motivação pré-prova"
```

## 6. Conteúdo — Reels de revisão

```bash
/library use conn-n8n-content
# → workflow 08-viral-instagram-reels ou 12-viral-shorts-machine
```

## 7. Parcerias — lista de perfis OAB

```bash
# perfis alvo: 10k-100k seguidores, nicho OAB
# no Claude Code: "lista 10 perfis OAB no IG com 10k-100k para parceria"
```

## 8. Auditoria semanal

```bash
/library use skill-weekly-audit
# → "auditoria Pena: cadastros, ativação (1 simulado), retenção D7, NPS"
```
