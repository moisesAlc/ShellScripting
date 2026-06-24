# Shell Scripting com Bash — Guia do aluno

**Material de estudo autodidata · Trilha por tópicos · Prática com projetos**

---

## Repositório

**URL do projeto:**  
https://github.com/moisesAlc/ShellScripting

**Como obter o material:**

```bash
git clone https://github.com/moisesAlc/ShellScripting.git
cd ShellScripting
```

Se preferir apenas ler online, abra o README no GitHub:  
https://github.com/moisesAlc/ShellScripting/blob/main/README.md

---

## O que é este repositório?

Este repositório é um **curso aberto de Shell Scripting com Bash**, organizado em **pastas por tópico** (shell, pipes, condicionais, loops, funções, fluxos de I/O, SSH, etc.). Cada pasta contém:

- **Teoria** — arquivos `.md` com explicações e exemplos.
- **Exercícios** — arquivo `exercicios.md` com tarefas curtas e critérios de aceite.
- **Scripts de apoio** — exemplos prontos para rodar e modificar (por exemplo `pipe/log.txt`, `condicional/teste_then.sh`).

Há também a pasta **`pratica/`**, com:

- **Plano completo de exercícios** — roteiro numerado com níveis de dificuldade (fixação, integração, desafio, marco).
- **Gabaritos opcionais** — soluções de referência para comparar depois de tentar sozinho.
- **Dois projetos** — calculadora interativa e integradora de logs (cenário próximo de scripts de servidor).

O foco é **Bash em ambientes Linux-like** (Linux, WSL, Git Bash, macOS com Bash explícito), com noção de diferença entre shells (`sh`, Bash, Zsh, Fish) e boas práticas para scripts reutilizáveis.

---

## Para quem é?

- Quem está **começando** no terminal e quer ir além de digitar comandos avulsos.
- Desenvolvedores que precisam **automatizar** tarefas, analisar logs ou escrever scripts de deploy/backup.
- Estudantes de sistemas, DevOps ou backend que precisam de base sólida antes de ferramentas como Docker, CI ou Ansible.

**Pré-requisitos:** acesso a um terminal com **Bash** (versão 4 ou superior recomendada para o tópico de arrays). Não é necessário saber programar em outra linguagem, mas ajuda ter noção de “programa”, “arquivo” e “linha de comando”.

---

## O que você pode ganhar ao concluir a trilha

### Competências técnicas

| Área | O que você será capaz de fazer |
|------|--------------------------------|
| Terminal | Diferenciar emulador, shell e canal (TTY/PTY); escolher o interpretador certo para cada script |
| Sintaxe Bash | `if`, `case`, loops, funções, arrays, entrada com `read`, cálculos com `$(( ))` e `bc` |
| Unix no dia a dia | Montar **pipelines** (`grep`, `sort`, `awk`), redirecionar stdout/stderr, parsear arquivos com `IFS` |
| Configuração | **Variáveis de ambiente**, `export`, arquivos `.env`, defaults com `${VAR:-padrao}` |
| Robustez | Usar `set -euo pipefail`, exit codes, `trap` para limpeza e reação a Ctrl+C |
| Rede | Conectar por **SSH**, usar chaves e `~/.ssh/config`, rodar comandos e `scp` em scripts |
| Projetos | Entregar uma calculadora em shell e evoluir um gerador/tratador de logs com tratamento de erros |

### Hábitos profissionais

- Shebang `#!/usr/bin/env bash`
- Variáveis sempre entre aspas: `"$var"`
- Erros visíveis em **stderr** e códigos de saída corretos
- Testar sintaxe com `bash -n script.sh` antes de executar

### Base para o próximo passo

Scripts em servidores Linux, jobs de **CI/CD**, entrypoints em **Docker**, automação com Ansible, e aprofundamento em `awk`/`sed` ou administração de sistemas.

---

## Como usar o repositório — passo a passo

### 1. Prepare o ambiente

- **Linux:** use o terminal padrão; confira `bash --version`.
- **Windows:** prefira **WSL2** ou **Git Bash**; veja o tópico de shell (Windows/macOS) em `shell/sessoes.md`.
- **macOS:** o shell padrão pode ser Zsh; invoque `bash` ou instale Bash via Homebrew para alinhar com o material.

### 2. Siga a ordem de estudo

O **README.md** lista **21 passos** sugeridos. Resumo:

| Etapas | Conteúdo |
|--------|----------|
| 1–3 | Shell, entrada do usuário, pipes |
| 4–8 | Condicionais, cálculos, `case`, loops |
| 9–15 | Funções, redirecionamento, IFS, texto, arrays, robustez, **variáveis de ambiente** |
| 16 | Projeto **calculadora** |
| 17–18 | Tmux e TTY/PTY *(opcional)* |
| 19–20 | Trap (sinais) e SSH |
| 21 | Projeto **integradora de logs** |

Leia a teoria de cada pasta, depois abra o **`exercicios.md`** da mesma pasta.

### 3. Pratique com o plano de exercícios

Arquivo central: **`pratica/PLANO-EXERCICIOS.md`**

- Cada exercício tem **ID** (ex.: `4.F1`), **nível** (F/I/D/M) e **critério de aceite**.
- Salve **suas** soluções em `pratica/minha-solucao/<topico>/` (pasta local; não precisa enviar ao Git).
- Depois de tentar, compare com **`pratica/solucoes/`** (gabaritos opcionais).
- Valide sintaxe dos gabaritos: `bash pratica/validar-solucoes.sh`

### 4. Faça os dois projetos

**Calculadora** (após funções e fluxos):

```bash
cd ShellScripting
bash pratica/calculadora/calculadora.sh
```

Implemente a sua versão conforme o plano (seção 15, marcos M1–M3).

**Integradora de logs** (final da trilha):

```bash
cd pratica/integradora
bash script.sh
```

Evolua o script em **estágios** (M1 a M7 no plano): stderr, arquivos de erro, `trap`, relatórios com `grep`/`awk`. Não tente fazer tudo de uma vez.

### 5. SSH sem servidor na nuvem

Se não tiver VPS, use **`pratica/ssh-lab.md`**: `ssh localhost`, Docker ou VM local.

### 6. Ritmo sugerido

| Perfil | Ritmo |
|--------|--------|
| Dedicação parcial | 1 tópico por semana + exercícios da seção |
| Intensivo | 1–2 tópicos por dia; projetos em um fim de semana cada |
| Só revisão | Use o índice do README e `exercicios.md` por lacuna |

Marque o **checklist** no final de `PLANO-EXERCICIOS.md` conforme for concluindo.

---

## Mapa rápido de arquivos importantes

| Arquivo | Função |
|---------|--------|
| `README.md` | Ordem de estudo e índice de todas as pastas |
| `pratica/PLANO-EXERCICIOS.md` | Roteiro completo de exercícios |
| `pratica/solucoes/README.md` | Gabaritos de referência |
| `pratica/ssh-lab.md` | Laboratório SSH local |
| `GUIA-ALUNO.md` | Este documento |
| `CAMINHOS-ANTIGOS.md` | Redirecionamento se você tinha links antigos |

---

## Convenções ao escrever scripts

```bash
#!/usr/bin/env bash
# Sempre cite variáveis:
nome="valor"
echo "Olá, $nome"

# Teste antes de rodar:
bash -n meu_script.sh
```

---

## Perguntas frequentes

**Preciso fazer tudo em ordem?**  
A ordem do README é a mais segura. Tópicos 16–17 (tmux, sessões) são opcionais. Se já souber condicionais, pode acelerar o início, mas não pule pipes e redirecionamento antes da integradora.

**Onde estão as respostas?**  
Em `pratica/solucoes/`. Tente primeiro; use os gabaritos para conferir.

**Meu script funciona no Zsh mas não no Bash.**  
Este curso é **Bash**. Rode com `bash script.sh` ou corrija o shebang para `#!/usr/bin/env bash`.

**E no Windows sem WSL?**  
Git Bash serve para a maior parte; alguns exercícios (SSH, `/etc/passwd`, permissões) ficam limitados — WSL é preferível.

---

## Contato e contribuição

Repositório: https://github.com/moisesAlc/ShellScripting  

Fork, issues e melhorias são bem-vindos conforme a licença do projeto (veja arquivo `LICENSE` na raiz, se existir).

---

*Documento para impressão ou exportação em PDF. Versão alinhada à estrutura por tópicos do repositório Shell Scripting com Bash.*
