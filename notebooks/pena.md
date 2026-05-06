# Pena — AIOS Session
> AI for the Brazilian bar exam · pena.click · adaptive practice tests · priority #3

---

## 1. Boot — project guide

```bash
aios ctx
```

## 2. Go to the repo

```bash
cd ~/projects/penaclick
git status
gh issue list --label sprint
```

## 3. Load context in Claude

```bash
/library use context-global
/library use context-pena
```

## 4. Verify deploy

```bash
vercel ls | grep pena
gh run list --limit 5
```

## 5. Content — bar exam tips (IG/TikTok)

```bash
/library use skill-content-post
# → "generate 5 bar exam posts: quick tips, practice snippets, pre-exam motivation"
```

## 6. Content — review Reels

```bash
/library use conn-n8n-content
# → workflow 08-viral-instagram-reels ou 12-viral-shorts-machine
```

## 7. Partnerships — bar exam profile list

```bash
# target profiles: 10k-100k followers, bar exam niche
# in Claude Code: "list 10 bar exam IG profiles with 10k-100k followers for partnership"
```

## 8. Next ship

```bash
# in Claude Code:
# "what is the next smallest delivery that increases activation and retention now?"
```
