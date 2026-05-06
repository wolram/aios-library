# MSS Consultoria — AIOS Session
> 4-week sprint · R$3k-15k · mssconsultoria.com.br · priority #2

---

## 1. Boot — project guide

```bash
aios ctx
```

## 2. Go to the repo

```bash
cd ~/projects/mssconsultoria
git status
gh issue list
```

## 3. Load context in Claude

```bash
/library use context-global
/library use context-mss
```

## 4. Lead pipeline — check status

```bash
# Linear: see leads in progress
open https://linear.app
# → filter by MSS Consultoria project
```

## 5. Client automation — start the sprint

```bash
# in Claude Code:
/library use conn-n8n-business
# → workflow 5_Sales_Pipeline_Automation for a new lead
```

## 6. Content — automation behind the scenes

```bash
/library use skill-content-post
# → "generate a post showing real automation behind the scenes for @mssconsultor.ia"
```

## 7. Proposal — generate the document

```bash
# in Claude Code after loading context:
# "generate a proposal for [company] — process: [describe] — scope: 4 weeks"
```

## 8. Next ship

```bash
# in Claude Code:
# "what is the next smallest delivery that increases leads and proposals now?"
```
