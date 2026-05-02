#!/usr/bin/env bash
# AIOS — guia rápido no terminal
# uso: bash ~/.claude/skills/library/aios.sh [contexto|skills|auto|recursos|novo|help]

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
  section "CONTEXTO — /library use <name>"
  row "context-global"       "voz, missão, ICP, valores, bio"
  row "context-priorities"   "roadmap 90d, 5 projetos, metas"
  row "context-icp"          "perfil de cliente cross-projeto"
  printf "\n"
  row "context-cltxpj"       "CLT×PJ — calculadora, ads, Apple Store"
  row "context-mss"          "MSS — sprint 4 semanas, R\$3k-15k"
  row "context-pena"         "Pena — OAB, simulados, afiliados"
  row "context-construct-os" "ConstructOS — Rust+React, obras B2B"
  row "context-tinderpromos" "TinderPromos — afiliados + JobApp"
}

show_skills() {
  section "SKILLS — /library use <name>"
  row "skill-content-post"     "posts IG/TikTok/X/Threads (voz Marlow)"
  row "skill-seo-article"      "artigos SEO por persona"
  row "skill-weekly-audit"     "auditoria semanal de projeto"
  row "skill-project-init"     "onboard novo projeto no AIOS"
}

show_auto() {
  section "AUTOMAÇÕES — /library use <name>"
  row "conn-n8n-content"       "14 workflows: TikTok, LinkedIn, YouTube, Veo3"
  row "conn-n8n-business"      "10 workflows: CI/CD, sprint, sales, finance"
  row "conn-uipath"            "RPA BR — CEP validator, address parsing"
  row "skill-macos-automation" "scripts Python: desktop, iCloud, workspace"
}

show_recursos() {
  section "RECURSOS — /library use resource-manager"
  row "accounts.yaml"       "contas AI + APIs + custo/mês"
  row "subscriptions.yaml"  "SaaS: Linear, Vercel, GitHub, Apple..."
  row "token-budgets.yaml"  "budget por projeto + max 50k tokens/sessão"
  row "auth-health.yaml"    "status auth: gh, vercel, n8n, openai..."
  printf "\n"
  note "Perguntas úteis após /library use resource-manager:"
  note "  → quanto gasto por mês?"
  note "  → qual auth está expirando?"
  note "  → qual o budget do cltxpj?"
}

show_novo() {
  section "NOVO PROJETO — passo a passo"
  printf "\n  ${BOLD}1. criar repo${RESET}\n"
  cmd    "     gh repo create wolram/<projeto> --private --clone && cd <projeto>"
  printf "\n  ${BOLD}2. carregar contexto${RESET}\n"
  cmd    "     /library use context-global"
  cmd    "     /library use context-<projeto>"
  printf "\n  ${BOLD}3. criar CLAUDE.md mínimo${RESET}\n"
  cmd    "     /init"
  printf "\n  ${BOLD}4. verificar recursos${RESET}\n"
  cmd    "     /library use resource-manager"
  printf "\n  ${BOLD}5. checklist no aios-context${RESET}\n"
  note   "     [ ] projects/<nome>.md em aios-context"
  note   "     [ ] entry em library.yaml"
  note   "     [ ] monthly_tokens em token-budgets.yaml"
  note   "     [ ] used_by nas subscriptions relevantes"
}

show_projetos_existentes() {
  section "PROJETO EXISTENTE — integrar AIOS"
  printf "\n  ${BOLD}Se máquina nova:${RESET}\n"
  cmd    "     git clone git@github.com:wolram/aios-library ~/.claude/skills/library"
  printf "\n  ${BOLD}Em qualquer sessão:${RESET}\n"
  cmd    "     /library use context-global"
  cmd    "     /library use resource-manager"
  printf "\n  ${BOLD}Adicionar contexto novo:${RESET}\n"
  cmd    "     cd /tmp/aios-context"
  cmd    "     # criar projects/<nome>.md"
  cmd    "     git add . && git commit -m 'feat: add context <nome>' && git push"
  cmd    "     # adicionar entry em ~/.claude/skills/library/library.yaml"
}

show_warp() {
  section "WARP — atalhos recomendados"
  printf "\n  ${BOLD}Workflows (CMD+SHIFT+R):${RESET}\n"
  row "aios-boot"        "cd ~/.claude/skills/library && git pull"
  row "aios-auth-check"  "gh auth status && vercel whoami"
  row "aios-ctx-push"    "cd /tmp/aios-context && git add . && git commit -m 'update: context' && git push"
  row "aios-lib-push"    "cd ~/.claude/skills/library && git add library.yaml && git commit -m 'feat: update catalog' && git push"
  printf "\n  ${BOLD}AI Prompts:${RESET}\n"
  row "aios-boot"        "/library use context-global && /library use context-priorities"
  row "sprint-audit"     "faz auditoria do sprint usando skill-weekly-audit"
  row "content-batch"    "gera 5 posts para [projeto] usando skill-content-post"
  printf "\n  ${BOLD}Env (global, não commitar):${RESET}\n"
  note   "     ANTHROPIC_API_KEY · OPENAI_API_KEY · LINEAR_API_KEY · VERCEL_TOKEN"
}

show_all() {
  header
  show_context
  show_skills
  show_auto
  show_recursos
  printf "\n"
  section "INÍCIO RÁPIDO"
  cmd    "  /library use context-global      # quem é Marlow"
  cmd    "  /library use context-<projeto>   # contexto do projeto"
  cmd    "  /library use resource-manager    # custos e auth"
  printf "\n"
  note "Guia completo: cat ~/.claude/skills/library/USAGE.md"
  note "Repositório:   github.com/wolram/aios-library"
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
    printf "  ${BOLD}Uso:${RESET} bash ~/.claude/skills/library/aios.sh [seção]\n\n"
    row "contexto / ctx"  "catalog de contexto por projeto"
    row "skills"          "skills operacionais"
    row "auto"            "workflows n8n, scripts, UiPath"
    row "recursos / res"  "accounts, subscriptions, tokens, auth"
    row "novo"            "passo a passo projeto novo"
    row "existente / int" "integrar projeto existente"
    row "warp"            "atalhos Warp recomendados"
    row "(sem args)"      "mostra tudo"
    printf "\n"
    ;;
  all|*)           show_all ;;
esac
