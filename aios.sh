#!/usr/bin/env bash
# AIOS — quick terminal guide
# usage: bash ~/.claude/skills/library/aios.sh [context|skills|auto|resources|new|help]

BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
RED='\033[0;31m'
RESET='\033[0m'

section() { printf "\n${BOLD}${CYAN}━━━ $1 ${RESET}\n"; }
row()     { printf "  ${GREEN}%-28s${RESET} %s\n" "$1" "$2"; }
note()    { printf "  ${DIM}$1${RESET}\n"; }
cmd()     { printf "  ${YELLOW}$1${RESET}\n"; }
warn()    { printf "  ${RED}⚠  $1${RESET}\n"; }

header() {
printf "${BOLD}
  █████╗ ██╗ ██████╗ ███████╗
 ██╔══██╗██║██╔═══██╗██╔════╝
 ███████║██║██║   ██║███████╗
 ██╔══██║██║██║   ██║╚════██║
 ██║  ██║██║╚██████╔╝███████║
 ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚══════╝${RESET}
 ${DIM}AI Operating System — wolram/aios-library${RESET}
"
}

show_context() {
  section "CONTEXT — /library use <name>"
  row "context-global"       "voice, mission, ICP, values, bio"
  row "context-priorities"   "90d roadmap, 5 projects, goals"
  row "context-icp"          "cross-project customer profile"
  printf "\n"
  row "context-cltxpj"       "CLT×PJ — calculator, ads, App Store"
  row "context-mss"          "MSS — 4-week sprint, R\$3k-15k"
  row "context-pena"         "Pena — bar exam, practice tests, affiliates"
  row "context-construct-os" "ConstructOS — Rust+React, B2B construction"
  row "context-tinderpromos" "TinderPromos — affiliates + JobApp"
}

show_skills() {
  section "SKILLS — /library use <name>"
  row "skill-content-post"     "IG/TikTok/X/Threads posts (Marlow voice)"
  row "skill-seo-article"      "SEO articles by persona"
  row "skill-project-init"     "onboard a new project into AIOS"
  note "review only when there is a blocker, a divergence, or explicit validation"
}

show_auto() {
  section "AUTOMATIONS — /library use <name>"
  row "conn-n8n-content"       "14 workflows: TikTok, LinkedIn, YouTube, Veo3"
  row "conn-n8n-business"      "10 workflows: CI/CD, sprint, sales, finance"
  row "conn-uipath"            "Brazilian RPA — CEP validator, address parsing"
  row "skill-macos-automation" "Python scripts: desktop, iCloud, workspace"
}

show_recursos() {
  section "RESOURCES — /library use resource-manager"
  row "accounts.yaml"       "AI accounts + APIs + monthly cost"
  row "subscriptions.yaml"  "SaaS: Linear, Vercel, GitHub, Apple..."
  row "token-budgets.yaml"  "project budget + max 50k tokens/session"
  row "auth-health.yaml"    "auth status: gh, vercel, n8n, openai..."
  printf "\n"
  note "Useful questions after /library use resource-manager:"
  note "  → how much do I spend per month?"
  note "  → which auth is expiring?"
  note "  → what is the cltxpj budget?"
}

show_novo() {
  section "NEW PROJECT — step by step"
  printf "\n  ${BOLD}1. create repo${RESET}\n"
  cmd    "     gh repo create wolram/<projeto> --private --clone && cd <projeto>"
  printf "\n  ${BOLD}2. load context${RESET}\n"
  cmd    "     /library use context-global"
  cmd    "     /library use context-<projeto>"
  printf "\n  ${BOLD}3. create the minimum CLAUDE.md${RESET}\n"
  cmd    "     /init"
  printf "\n  ${BOLD}4. check resources${RESET}\n"
  cmd    "     /library use resource-manager"
  printf "\n  ${BOLD}5. checklist in aios-context${RESET}\n"
  note   "     [ ] projects/<nome>.md em aios-context"
  note   "     [ ] entry em library.yaml"
  note   "     [ ] monthly_tokens em token-budgets.yaml"
  note   "     [ ] used_by nas subscriptions relevantes"
  note   "     [ ] review only if the project needs it"
}

show_projetos_existentes() {
  section "EXISTING PROJECT — integrate AIOS"
  printf "\n  ${BOLD}If this is a new machine:${RESET}\n"
  cmd    "     git clone git@github.com:wolram/aios-library ~/.claude/skills/library"
  printf "\n  ${BOLD}In any session:${RESET}\n"
  cmd    "     /library use context-global"
  cmd    "     /library use resource-manager"
  printf "\n  ${BOLD}Add new context:${RESET}\n"
  cmd    "     cd /tmp/aios-context"
  cmd    "     # create projects/<name>.md"
  cmd    "     git add . && git commit -m 'feat: add context <nome>' && git push"
  cmd    "     # add an entry in ~/.claude/skills/library/library.yaml"
}

show_warp() {
  section "WARP — recommended shortcuts"
  printf "\n  ${BOLD}Workflows (CMD+SHIFT+R):${RESET}\n"
  row "aios-boot"        "cd ~/.claude/skills/library && git pull"
  row "aios-auth-check"  "gh auth status && vercel whoami"
  row "aios-ctx-push"    "cd /tmp/aios-context && git add . && git commit -m 'update: context' && git push"
  row "aios-lib-push"    "cd ~/.claude/skills/library && git add library.yaml && git commit -m 'feat: update catalog' && git push"
  printf "\n  ${BOLD}AI Prompts:${RESET}\n"
  row "aios-boot"        "/library use context-global && /library use context-priorities"
  row "ship-next"        "define the next smallest delivery that moves value now"
  row "content-batch"    "generate 5 posts for [project] using skill-content-post"
  printf "\n  ${BOLD}Env (global, do not commit):${RESET}\n"
  note   "     ANTHROPIC_API_KEY · OPENAI_API_KEY · LINEAR_API_KEY · VERCEL_TOKEN"
}

show_all() {
  header
  show_context
  show_skills
  show_auto
  show_recursos
  printf "\n"
  section "QUICK START"
  cmd    "  /library use context-global      # who Marlow is"
  cmd    "  /library use context-<projeto>   # project context"
  cmd    "  /library use resource-manager    # costs and auth"
  note   "  review is optional; the happy path is to create and keep moving"
  printf "\n"
  note "Full guide: cat ~/.claude/skills/library/USAGE.md"
  note "Repository:   github.com/wolram/aios-library"
  printf "\n"
}

case "${1:-all}" in
  contexto|ctx)    header; show_context ;;
  skills)          header; show_skills ;;
  auto)            header; show_auto ;;
  recursos|res)    header; show_recursos ;;
  novo)            header; show_novo ;;
  existente|int)   header; show_projetos_existentes ;;
  warp)            header; show_warp ;;
  help)
    header
    printf "  ${BOLD}Usage:${RESET} bash ~/.claude/skills/library/aios.sh [section]\n\n"
    row "context / ctx"   "project context catalog"
    row "skills"          "operational skills"
    row "auto"            "n8n workflows, scripts, UiPath"
    row "resources / res" "accounts, subscriptions, tokens, auth"
    row "new"             "new project step by step"
    row "existing / int"  "integrate an existing project"
    row "warp"            "recommended Warp shortcuts"
    row "(no args)"       "show everything"
    printf "\n"
    ;;
  all|*)           show_all ;;
esac
