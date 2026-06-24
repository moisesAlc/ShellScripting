# 🗺️ Nível avançado

Robustez em scripts: sinais (`trap`), redirecionamento avançado (em evolução) e projeto de tratamento de logs.

## 🗺️ Ordem de leitura

1. 🖥️ [Shell: TTY, PTY e sessões](shell/shell.md) — aprofundamento do tópico iniciante (opcional antes de `trap`)
2. ⚡ [trap](trap/trap.md) — `SIGINT`, `EXIT`, limpeza de recursos
3. 🔐 [SSH](ssh/ssh.md) — chaves, `~/.ssh/config`, comando remoto, `scp`, scripts
4. 🖥️ Redirecionamento avançado *(a criar: heredoc, subshells)* — base em [redirecionamento](../intermediario/fluxos/redirecionamento.md)
5. 📜 Prática: [integradora de logs](pratica/integradora/)

## 🛠️ Prática

| 📌 Projeto | Caminho |
|---------|---------|
| 📜 Integradora | [pratica/integradora/](pratica/integradora/) — enunciado em [pratica/integradora/README.md](pratica/integradora/README.md) |

## ✅ Pré-requisito

Trilha [intermediária](../intermediario/README.md) (inclui calculadora em [pratica/calculadora](../intermediario/pratica/calculadora/)).

## 🚀 Planejado (fase inicial, genérico)

- 🔗 Exit codes e `set -euo pipefail`
- 🌐 HTTP com `curl`
- ⚙️ Variáveis de ambiente e config
