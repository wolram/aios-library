# CLT×PJ — AIOS Session
> CLT vs PJ calculator · cltxpj.app.br · App Store · priority #1

---

## 1. Boot — project guide

```bash
aios ctx
```

## 2. Go to the repo

```bash
cd ~/projects/CLT-x-PJ
git status
gh issue list --label sprint
```

## 3. Load context in Claude

```bash
# run inside a Claude Code session
/library use context-global
/library use context-cltxpj
```

## 4. Verify deploy

```bash
vercel ls | grep clt
gh run list --limit 5
```

## 5. Content — generate a batch of posts

```bash
# in Claude Code:
/library use skill-content-post
# → "generate 5 posts for CLT×PJ focused on devs receiving a PJ offer"
```

## 6. SEO — article by persona

```bash
# in Claude Code:
/library use skill-seo-article
# → "article: dev receiving a R$15k PJ offer — what is the net amount?"
```

## 7. KPIs — check metrics

```bash
# Vercel Analytics
open https://vercel.com/wolram/clt-x-pj/analytics
# App Store Connect
open https://appstoreconnect.apple.com
```

## 8. Next ship

```bash
# in Claude Code:
# "what is the next smallest delivery that increases calculator conversion now?"
```
