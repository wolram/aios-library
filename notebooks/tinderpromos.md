# TinderPromos + JobApp — AIOS Session
> Affiliates · tinderdaspromos.com.br · jobapp.site · priority #5

---

## 1. Boot — project guide

```bash
aios ctx
```

## 2. Go to the repos

```bash
cd ~/projects/03_DealsEngine_SideProject
git status

# JobApp
cd ~/projects/AppJob
git status
```

## 3. Load context in Claude

```bash
/library use context-global
/library use context-tinderpromos
```

## 4. Content — daily promotions

```bash
/library use conn-n8n-content
# → workflow 11-tiktok-viral-agent or 08-viral-instagram-reels
# input: daily promotions with affiliate link
```

## 5. Calendar — upcoming dates

```bash
# in Claude Code after loading context:
# "upcoming Brazilian promo dates in the next 30 days — generate a post calendar"
```

## 6. Affiliates — check performance

```bash
# open the affiliate program dashboard
open https://tinderdaspromos.com.br/admin
```

## 7. JobApp — landing and capture

```bash
cd ~/projects/AppJob
gh issue list
open https://jobapp.site
```

## 8. Next ship

```bash
# in Claude Code:
# "what is the next smallest delivery that increases clicks and revenue now?"
```
