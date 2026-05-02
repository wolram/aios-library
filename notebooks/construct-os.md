# ConstructOS — Sessão AIOS
> Gestão de obras B2B · Rust+Axum+React · construct-os-sigma.vercel.app · prioridade #4

---

## 1. Boot — guia do projeto

```bash
aios ctx
```

## 2. Navegar pro repo

```bash
cd ~/projects/construct-os
git status
gh issue list --label sprint
```

## 3. Carregar contexto no Claude

```bash
/library use context-global
/library use context-construct-os
```

## 4. Dev — rodar stack local

```bash
# backend Rust
cd backend && cargo run

# frontend React (nova aba)
cd frontend && pnpm dev
```

## 5. Verificar deploy frontend

```bash
vercel ls | grep construct
open https://construct-os-sigma.vercel.app
```

## 6. Pipeline de pilotos B2B

```bash
# Linear: leads de construtoras
open https://linear.app
# → filtrar por projeto ConstructOS, leads em abordagem
```

## 7. Outreach — abordar lead

```bash
# no Claude Code após carregar contexto:
# "gera mensagem WhatsApp para [empresa] — construtora regional, ~5 obras simultâneas"
```

## 8. Auditoria semanal

```bash
/library use skill-weekly-audit
# → "auditoria ConstructOS: pilotos ativos, retenção semanal, features críticas pedidas"
```
