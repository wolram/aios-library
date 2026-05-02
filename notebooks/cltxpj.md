# CLT×PJ — Sessão AIOS
> Calculadora CLT vs PJ · cltxpj.app.br · Apple Store · prioridade #1

---

## 1. Boot — guia do projeto

```bash
aios ctx
```

## 2. Navegar pro repo

```bash
cd ~/projects/CLT-x-PJ
git status
gh issue list --label sprint
```

## 3. Carregar contexto no Claude

```bash
# rodar dentro de uma sessão Claude Code
/library use context-global
/library use context-cltxpj
```

## 4. Verificar deploy

```bash
vercel ls | grep clt
gh run list --limit 5
```

## 5. Conteúdo — gerar batch de posts

```bash
# no Claude Code:
/library use skill-content-post
# → "gera 5 posts para CLT×PJ com foco em devs recebendo proposta PJ"
```

## 6. SEO — artigo por persona

```bash
# no Claude Code:
/library use skill-seo-article
# → "artigo: dev recebendo proposta PJ de R$15k — quanto fica no líquido?"
```

## 7. KPIs — checar métricas

```bash
# Vercel Analytics
open https://vercel.com/wolram/clt-x-pj/analytics
# App Store Connect
open https://appstoreconnect.apple.com
```

## 8. Auditoria semanal

```bash
# no Claude Code:
/library use skill-weekly-audit
# → "auditoria CLT×PJ: sessões, conversão calculadora→app, receita ads"
```
