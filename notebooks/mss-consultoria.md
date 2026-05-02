# MSS Consultoria — Sessão AIOS
> Sprint 4 semanas · R$3k-15k · mssconsultoria.com.br · prioridade #2

---

## 1. Boot — guia do projeto

```bash
aios ctx
```

## 2. Navegar pro repo

```bash
cd ~/projects/mssconsultoria
git status
gh issue list
```

## 3. Carregar contexto no Claude

```bash
/library use context-global
/library use context-mss
```

## 4. Pipeline de leads — checar status

```bash
# Linear: ver leads em progresso
open https://linear.app
# → filtrar por projeto MSS Consultoria
```

## 5. Automação cliente — iniciar sprint

```bash
# no Claude Code:
/library use conn-n8n-business
# → workflow 5_Sales_Pipeline_Automation para novo lead
```

## 6. Conteúdo — bastidores de automação

```bash
/library use skill-content-post
# → "gera post mostrando bastidores de automação real para @mssconsultor.ia"
```

## 7. Proposta — gerar documento

```bash
# no Claude Code após carregar contexto:
# "gera proposta para [empresa] — processo: [descrever] — escopo: 4 semanas"
```

## 8. Auditoria semanal

```bash
/library use skill-weekly-audit
# → "auditoria MSS: leads contatados, reuniões, propostas, contratos fechados"
```
