# ConstructOS — AIOS Session
> B2B construction management · Rust+Axum+React · construct-os-sigma.vercel.app · priority #4

---

## 1. Boot — project guide

```bash
aios ctx
```

## 2. Go to the repo

```bash
cd ~/projects/construct-os
git status
gh issue list --label sprint
```

## 3. Load context in Claude

```bash
/library use context-global
/library use context-construct-os
```

## 4. Dev — run the local stack

```bash
# Rust backend
cd backend && cargo run

# React frontend (new tab)
cd frontend && pnpm dev
```

## 5. Verify frontend deploy

```bash
vercel ls | grep construct
open https://construct-os-sigma.vercel.app
```

## 6. B2B pilot pipeline

```bash
# Linear: construction leads
open https://linear.app
# → filter by ConstructOS project, leads in outreach
```

## 7. Outreach — contact the lead

```bash
# in Claude Code after loading context:
# "generate a WhatsApp message for [company] — regional builder, ~5 active sites"
```

## 8. Next ship

```bash
# in Claude Code:
# "what is the next smallest delivery that accelerates pilots and retention now?"
```
