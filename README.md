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
| 9 | [pratica/calculadora/](pratica/calculadora/) | Projeto: calculadora |
| 10 | [funcoes/funcoes.md](funcoes/funcoes.md) | Funções |
| 11 | [fluxos/redirecionamento.md](fluxos/redirecionamento.md) | `stdin` / `stdout` / `stderr` |
| 12 | [fluxos/IFS.md](fluxos/IFS.md) | Parsing de campos, `while read` |
| 13 | [arrays/arrays.md](arrays/arrays.md) | Arrays |
| 14 | [tmux/tmux.md](tmux/tmux.md) | Sessões no terminal *(opcional)* |
| 15 | [shell/sessoes.md](shell/sessoes.md) | TTY/PTY, empilhamento, Windows/macOS *(opcional)* |
| 16 | [trap/trap.md](trap/trap.md) | `SIGINT`, `EXIT`, `SIGHUP`, limpeza |
| 17 | [ssh/ssh.md](ssh/ssh.md) | Chaves, `~/.ssh/config`, `scp`, scripts remotos |
| 18 | [pratica/integradora/](pratica/integradora/) | Projeto: integradora de logs |

🚀 Comece por [O que é um shell?](shell/shell.md).

## 📂 Tópicos (índice)

| Pasta | Arquivos principais |
|-------|---------------------|
| [shell/](shell/) | [shell.md](shell/shell.md), [sessoes.md](shell/sessoes.md) |
| [entrada_usuario/](entrada_usuario/) | [entrada.md](entrada_usuario/entrada.md) |
| [pipe/](pipe/) | [pipe.md](pipe/pipe.md), `script.sh`, `log.txt` |
| [condicional/](condicional/) | [condicional.md](condicional/condicional.md), `teste_then.sh` |
| [calculos/](calculos/) | [calculos.md](calculos/calculos.md) |
| [case/](case/) | [case.md](case/case.md), `script.sh` |
| [loop/](loop/) | [for.md](loop/for.md), [while.md](loop/while.md) |
| [funcoes/](funcoes/) | [funcoes.md](funcoes/funcoes.md) |
| [fluxos/](fluxos/) | [redirecionamento.md](fluxos/redirecionamento.md), [IFS.md](fluxos/IFS.md) |
| [arrays/](arrays/) | [arrays.md](arrays/arrays.md) |
| [tmux/](tmux/) | [tmux.md](tmux/tmux.md) |
| [trap/](trap/) | [trap.md](trap/trap.md) |
| [ssh/](ssh/) | [ssh.md](ssh/ssh.md) |
| [pratica/](pratica/) | [PLANO-EXERCICIOS.md](pratica/PLANO-EXERCICIOS.md), [iniciante.md](pratica/iniciante.md), [calculadora/](pratica/calculadora/), [integradora/](pratica/integradora/) |

## 🎯 Objetivos

- 📖 Dominar sintaxe e idiomas comuns do Bash para scripts reutilizáveis.
- 🔁 Entender **condicionais**, **loops**, **funções**, **arrays** e manipulação de texto.
- 🔗 Usar **pipes**, **redirecionamento** e variáveis como `IFS` de forma consciente.
- ⌨️ Trabalhar com **entrada do usuário**, **cálculos** e ferramentas auxiliares (por exemplo `tmux`).

## ✅ Pré-requisitos

- 📚 Linux ou ambiente compatível com **Bash** (versão 4+ recomendada para arrays).
- 🖥️ No Windows ou macOS: [shell.md](shell/shell.md) (visão geral) e [shell/sessoes.md](shell/sessoes.md) (Git Bash, WSL, macOS).

## 💡 Projetos práticos

**Plano completo de exercícios** — [pratica/PLANO-EXERCICIOS.md](pratica/PLANO-EXERCICIOS.md) (fixação por tópico, marcos e checklist).

**Exercícios leves (trecho inicial)** — [pratica/iniciante.md](pratica/iniciante.md) (itens 2–3 do plano, após `pipe`).

**🧮 Calculadora**:

```bash
bash pratica/calculadora/calculadora.sh
```

**📜 Integradora de logs** — [enunciado](pratica/integradora/README.md):

```bash
cd pratica/integradora
bash script.sh
```

## 📌 Convenções rápidas

- 📖 Preferir `#!/usr/bin/env bash` no shebang.
- 📌 Citar variáveis: `"$var"` e `"$1"`.
- 🔀 Testar sintaxe: `bash -n script.sh`.

## 📌 Extensões planejadas

- 🔗 Exit codes e `set -euo pipefail`
- 🌐 HTTP com `curl`
- ⚙️ Variáveis de ambiente e config
- 🖥️ Redirecionamento avançado (heredoc, subshells)

Sem provedor de cloud nesta fase. Links antigos: [CAMINHOS-ANTIGOS.md](CAMINHOS-ANTIGOS.md).

## 📌 Licença e uso

Material para estudo e formação. Se existir `LICENSE` na raiz, siga-o ao forkar.
