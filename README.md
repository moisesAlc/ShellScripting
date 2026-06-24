# 🖥️ Shell Scripting com Bash

Material de estudo e prática em **Shell Scripting** (Bash), organizado **por tópico**. A ordem abaixo é a sugestão de leitura — você pode pular tópicos opcionais ou voltar quando precisar.

## 🗺️ Ordem de estudo sugerida

| # | Tópico | Conteúdo |
|---|--------|----------|
| 1 | [shell/shell.md](shell/shell.md) | O que é shell, terminal vs shell, Bash/Zsh/Fish/`sh` |
| 2 | [entrada_usuario/entrada.md](entrada_usuario/entrada.md) | `read` e prompts |
| 3 | [pipe/pipe.md](pipe/pipe.md) | Pipes, `grep`, `sort`, exemplos com `log.txt` |
| 4 | [condicional/condicional.md](condicional/condicional.md) | `if`, `test`, `[[ ]]` |
| 5 | [calculos/calculos.md](calculos/calculos.md) | `expr`, `(())`, `bc` |
| 6 | [case/case.md](case/case.md) | Menus com `case` |
| 7 | [loop/for.md](loop/for.md) | Loop `for` |
| 8 | [loop/while.md](loop/while.md) | Loop `while` |
| 9 | [funcoes/funcoes.md](funcoes/funcoes.md) | Funções |
| 10 | [fluxos/redirecionamento.md](fluxos/redirecionamento.md) | `stdin` / `stdout` / `stderr` |
| 11 | [fluxos/IFS.md](fluxos/IFS.md) | Parsing de campos, `while read` |
| 12 | [texto/manipulacao.md](texto/manipulacao.md) | `grep`, `sed`, `awk` |
| 13 | [arrays/arrays.md](arrays/arrays.md) | Arrays |
| 14 | [fluxos/robustez.md](fluxos/robustez.md) | `set -euo pipefail`, exit codes |
| 15 | [pratica/calculadora/](pratica/calculadora/) | Projeto: calculadora |
| 16 | [tmux/tmux.md](tmux/tmux.md) | Sessões no terminal *(opcional)* |
| 17 | [shell/sessoes.md](shell/sessoes.md) | TTY/PTY, empilhamento, Windows/macOS *(opcional)* |
| 18 | [trap/trap.md](trap/trap.md) | `SIGINT`, `EXIT`, `SIGHUP`, limpeza |
| 19 | [ssh/ssh.md](ssh/ssh.md) | Chaves, `~/.ssh/config`, `scp`, scripts remotos |
| 20 | [pratica/integradora/](pratica/integradora/) | Projeto: integradora de logs |

🚀 Comece por [O que é um shell?](shell/shell.md).

## 📂 Tópicos (índice)

| Pasta | Teoria | Exercícios |
|-------|--------|------------|
| [shell/](shell/) | [shell.md](shell/shell.md), [sessoes.md](shell/sessoes.md) | [exercicios.md](shell/exercicios.md) |
| [entrada_usuario/](entrada_usuario/) | [entrada.md](entrada_usuario/entrada.md) | [exercicios.md](entrada_usuario/exercicios.md) |
| [pipe/](pipe/) | [pipe.md](pipe/pipe.md) | [exercicios.md](pipe/exercicios.md) |
| [condicional/](condicional/) | [condicional.md](condicional/condicional.md) | [exercicios.md](condicional/exercicios.md) |
| [calculos/](calculos/) | [calculos.md](calculos/calculos.md) | [exercicios.md](calculos/exercicios.md) |
| [case/](case/) | [case.md](case/case.md) | [exercicios.md](case/exercicios.md) |
| [loop/](loop/) | [for.md](loop/for.md), [while.md](loop/while.md) | [exercicios.md](loop/exercicios.md) |
| [funcoes/](funcoes/) | [funcoes.md](funcoes/funcoes.md) | [exercicios.md](funcoes/exercicios.md) |
| [fluxos/](fluxos/) | [redirecionamento.md](fluxos/redirecionamento.md), [IFS.md](fluxos/IFS.md), [robustez.md](fluxos/robustez.md) | [exercicios.md](fluxos/exercicios.md) |
| [texto/](texto/) | [manipulacao.md](texto/manipulacao.md) | [exercicios.md](texto/exercicios.md) |
| [arrays/](arrays/) | [arrays.md](arrays/arrays.md) | [exercicios.md](arrays/exercicios.md) |
| [tmux/](tmux/) | [tmux.md](tmux/tmux.md) | [exercicios.md](tmux/exercicios.md) |
| [trap/](trap/) | [trap.md](trap/trap.md) | [exercicios.md](trap/exercicios.md) |
| [ssh/](ssh/) | [ssh.md](ssh/ssh.md) | [exercicios.md](ssh/exercicios.md) |
| [pratica/](pratica/) | [calculadora/](pratica/calculadora/), [integradora/](pratica/integradora/) | [PLANO-EXERCICIOS.md](pratica/PLANO-EXERCICIOS.md) |

## 🎯 Objetivos

- 📖 Dominar sintaxe e idiomas comuns do Bash para scripts reutilizáveis.
- 🔁 Entender **condicionais**, **loops**, **funções**, **arrays** e manipulação de texto.
- 🔗 Usar **pipes**, **redirecionamento** e variáveis como `IFS` de forma consciente.
- ⌨️ Trabalhar com **entrada do usuário**, **cálculos** e ferramentas auxiliares (por exemplo `tmux`).

## ✅ Pré-requisitos

- 📚 Linux ou ambiente compatível com **Bash** (versão 4+ recomendada para arrays).
- 🖥️ No Windows ou macOS: [shell.md](shell/shell.md) (visão geral) e [shell/sessoes.md](shell/sessoes.md) (Git Bash, WSL, macOS).

## 💡 Prática

| Recurso | Descrição |
|---------|-----------|
| [PLANO-EXERCICIOS.md](pratica/PLANO-EXERCICIOS.md) | Roteiro completo com critérios de aceite |
| [solucoes/](pratica/solucoes/README.md) | Gabaritos de referência |
| [validar-solucoes.sh](pratica/validar-solucoes.sh) | Checagem de sintaxe dos gabaritos |
| [ssh-lab.md](pratica/ssh-lab.md) | Praticar SSH em localhost/Docker |
| [iniciante.md](pratica/iniciante.md) | Atalho para os primeiros exercícios |

**🧮 Calculadora** — `bash pratica/calculadora/calculadora.sh`

**📜 Integradora** — `cd pratica/integradora && bash script.sh` ([enunciado](pratica/integradora/README.md))

## 📌 Convenções rápidas

- 📖 Preferir `#!/usr/bin/env bash` no shebang.
- 📌 Citar variáveis: `"$var"` e `"$1"`.
- 🔀 Testar sintaxe: `bash -n script.sh`.

## 📌 Extensões planejadas

- 🌐 HTTP com `curl`
- ⚙️ Variáveis de ambiente e config
- 🖥️ Redirecionamento avançado (heredoc, subshells)

Links antigos: [CAMINHOS-ANTIGOS.md](CAMINHOS-ANTIGOS.md).

## 📌 Licença e uso

Material para estudo e formação. Se existir `LICENSE` na raiz, siga-o ao forkar.
