# Plano de exercícios

Roteiro de prática alinhado à [ordem de estudo](../README.md). Cada tópico traz exercícios **curtos** (fixação) e, quando couber, um **desafio** um pouco maior. Projetos (`calculadora`, `integradora`) aparecem como marcos.

## Como usar

1. Leia o tópico teórico (`.md` na pasta correspondente).
2. Faça os exercícios na ordem; pule só se já dominar o assunto.
3. Salve seus scripts em `pratica/minha-solucao/<topico>/` (crie a pasta localmente; não precisa versionar).
4. Antes de entregar para si mesmo: `bash -n script.sh` e teste com entrada normal, vazia e inválida quando fizer sentido.
5. Compare com [gabaritos](solucoes/README.md): `bash pratica/validar-solucoes.sh`.
6. Cada pasta tem [exercicios.md](../shell/exercicios.md) com o recorte do tópico; SSH sem servidor: [ssh-lab.md](ssh-lab.md).

### Níveis

| Nível | Sigla | Tempo típico | Objetivo |
|-------|-------|--------------|----------|
| Fixação | **F** | 5–15 min | Um conceito isolado |
| Integração | **I** | 20–40 min | Dois ou mais conceitos do tópico |
| Desafio | **D** | 45–90 min | Pequeno script completo |
| Marco | **M** | 2 h+ | Projeto da pasta `pratica/` |

### Critérios gerais (vale para todos)

- Shebang `#!/usr/bin/env bash` em scripts salvos em arquivo.
- Variáveis entre aspas: `"$var"`, `"$1"`.
- Mensagens de erro em **stderr** quando o script falhar (`echo "..." >&2`).
- Exit code: `0` sucesso, `1` (ou outro ≠ 0) em falha previsível.

---

## 1. shell — [shell/shell.md](../shell/shell.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 1.F1 | F | Em **duas** janelas de terminal, rode `pwd` e `echo $$` em cada uma. | Os PIDs diferem; `cd` em uma janela não muda o `pwd` da outra. |
| 1.F2 | F | No mesmo terminal, rode `echo $0`, depois `bash`, de novo `echo $0`, depois `exit`. | O nome do shell muda com `bash` e volta após `exit`. |
| 1.I1 | I | Identifique no seu sistema: shell de login (`echo $SHELL`), interpretador ativo (`ps -p $$ -o comm=`) e se `/bin/sh` é dash ou bash (`readlink -f /bin/sh`, `ls -l /bin/sh`). | Anote os três resultados num comentário no topo de um script vazio. |

*Aprofundamento opcional:* [shell/sessoes.md](../shell/sessoes.md) — exercícios na seção **17** abaixo. Recorte: [shell/exercicios-sessoes.md](../shell/exercicios-sessoes.md).

---

## 2. entrada_usuario — [entrada_usuario/entrada.md](../entrada_usuario/entrada.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 2.F1 | F | Script `saudacao.sh`: `read -p` pede o nome e imprime `Olá, NOME!`. | Funciona com nome de uma palavra e com espaços (teste `Maria Silva`). |
| 2.F2 | F | Pergunte a idade com `read` e exiba se é maior de idade (só mensagem, sem `if` ainda: use `(( idade >= 18 ))` ou deixe para o ex. 4.F1). | — |
| 2.I1 | I | Menu numérico simples: `1` continua, `0` sai (um `if` básico ou `case` se já viu). | Loop até escolher sair. |

---

## 3. pipe — [pipe/pipe.md](../pipe/pipe.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 3.F1 | F | Com `pipe/log.txt`: conte linhas que contêm `ERRO` (`grep -c`). | Número bate com contagem manual em arquivo pequeno. |
| 3.F2 | F | Pipeline: erros únicos ordenados — `grep ERRO log.txt \| sort \| uniq -c \| sort -nr`. | Entende cada etapa da saída. |
| 3.I1 | I | Altere `pipe/script.sh` para filtrar outra palavra (ex. `WARN` ou `INFO`). | Script roda sem erro e gera saída coerente. |
| 3.D1 | D | Script `resumo_log.sh`: recebe caminho de arquivo como `$1`; imprime total de linhas, quantidade de `ERRO` e de `INFO`. | Uso: `bash resumo_log.sh pipe/log.txt`; mensagem clara se arquivo não existir. |

---

## 4. condicional — [condicional/condicional.md](../condicional/condicional.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 4.F1 | F | Script `paridade.sh`: lê um número e diz par ou ímpar (`if` + `[ ]` ou `(( ))`). | Teste com 0, 2, 7 e entrada não numérica (mensagem de erro). |
| 4.F2 | F | Compare duas strings lidas com `read`; use `[[ ]]` para igualdade. | Aspas corretas em variáveis vazias. |
| 4.I1 | I | Estude e modifique `condicional/teste_then.sh`: adicione um `elif`. | `bash -n` ok; comportamento documentado em comentário. |
| 4.D1 | D | `valida_idade.sh`: idade entre 0 e 120; fora disso, stderr + exit 1. | Três casos de teste passam. |

---

## 5. calculos — [calculos/calculos.md](../calculos/calculos.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 5.F1 | F | Quatro operações com dois números usando `$(( ))` em linha de comando ou script curto. | Divisão inteira: explicar truncamento em comentário. |
| 5.F2 | F | Mesma conta com `bc` (2 casas decimais na divisão). | `scale=2` na divisão. |
| 5.I1 | I | Script `media.sh`: lê três notas (0–10), imprime média com `bc`. | Rejeita nota fora do intervalo. |

---

## 6. case — [case/case.md](../case/case.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 6.F1 | F | Menu de 3 opções + sair; opção inválida cai em `*)`. | Igual padrão de `case/script.sh`, mas com seus textos. |
| 6.I1 | I | Substitua `if` aninhados por `case` num script que classifica extensão de arquivo (`.sh`, `.txt`, `*`). | Uso: `bash classifica.sh documento.txt`. |

---

## 7. loop for — [loop/for.md](../loop/for.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 7.F1 | F | Imprima números 1 a 10 com `for i in $(seq 1 10)`. | Uma linha por número. |
| 7.F2 | F | Itere sobre arquivos `*.sh` na pasta atual e liste nomes. | Sem quebrar se não houver `.sh` (teste com `nullglob` ou `if`). |
| 7.I1 | I | Soma dos argumentos da linha de comando: `bash soma_args.sh 10 20 5` → `35`. | Loop `for arg in "$@"`. |

---

## 8. loop while — [loop/while.md](../loop/while.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 8.F1 | F | Contagem regressiva 5 a 1 com `sleep 1`. | Termina em `Fogo!` ou similar. |
| 8.F2 | F | Leia linhas de um arquivo até EOF (`while read -r linha`). | Conta linhas não vazias. |
| 8.I1 | I | “Adivinhe o número” (1–100): loop até acertar, dicas maior/menor. | Entrada inválida não quebra o loop. |

---

## 9. funcoes — [funcoes/funcoes.md](../funcoes/funcoes.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 9.F1 | F | Função `saudacao()` que usa `$1` e `echo`. | Chamar três vezes com nomes diferentes. |
| 9.F2 | F | Função com `local` que não altera variável global homônima. | Demonstrar com `echo` antes/depois. |
| 9.I1 | I | Extrair validação numérica para `eh_numero()` reutilizável. | Usada em `media.sh` ou na calculadora. |

---

## 10. redirecionamento — [fluxos/redirecionamento.md](../fluxos/redirecionamento.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 10.F1 | F | `comando_inexistente 2> erros.txt` — confira o arquivo. | stderr capturado; stdout não misturado. |
| 10.F2 | F | Redirecione stdout e stderr para arquivos **diferentes** no mesmo comando. | Dois arquivos com conteúdo correto. |
| 10.I1 | I | Script `duplica_log.sh`: copia stdin para dois arquivos (`tee` ou redirecionamento). | Teste: `echo teste \| bash duplica_log.sh a.txt b.txt`. |
| 10.D1 | D | Wrapper: `bash roda.sh script.sh` grava stdout em `saida.log` e stderr em `erro.log`. | Exit code do script filho preservado (`$?`). |

---

## 11. IFS — [fluxos/IFS.md](../fluxos/IFS.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 11.F1 | F | Ler `/etc/passwd` (ou CSV fake): imprimir só o primeiro campo por linha. | `IFS=:` ou `IFS=,` conforme arquivo. |
| 11.I1 | I | Script que soma a terceira coluna de um CSV de três colunas. | `while IFS=, read -r c1 c2 c3`. |
| 11.D1 | D | Converter `pipe/log.txt` em resumo: tipo e contagem por tipo. | Saída tabular simples. |

---

## 12. manipulação de texto — [texto/manipulacao.md](../texto/manipulacao.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 12.F1 | F | `grep` + `awk`: contar linhas por tag no `log_output.txt` da integradora. | Saída legível (tag + contagem). |
| 12.I1 | I | Pipeline `grep ERROR … \| awk … \| sort` extraindo timestamp e mensagem. | Documentar cada estágio. |
| 12.D1 | D | Script `relatorio_log.sh ARQUIVO` — resumo por tag (integradora M7). | Aceita path como `$1`. |

---

## 13. arrays — [arrays/arrays.md](../arrays/arrays.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 13.F1 | F | Array de 5 frutas; imprimir todas com `${frutas[@]}`. | Índice e tamanho `${#frutas[@]}`. |
| 13.I1 | I | Sorteio: array `INFO`/`WARN`/`ERROR` como na integradora. | `indice=$(($RANDOM % ${#arr[@]}))`. |
| 13.D1 | D | Script: min, max e média dos argumentos (Bash 4+). | Entrada vazia tratada. |

---

## 14. robustez — [fluxos/robustez.md](../fluxos/robustez.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 14.F1 | F | Script com `set -euo pipefail` onde um comando falha de propósito. | Script para; sem `set -e` continuaria. |
| 14.I1 | I | Pipeline: comparar exit code com e sem `set -o pipefail`. | Documentar diferença em comentário. |

---

## 15. Marco — Calculadora — [pratica/calculadora/](../pratica/calculadora/)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 15.M1 | M | Implemente ou compare com `calculadora.sh`: menu, quatro operações, sair. | Divisão por zero; loop até sair. |
| 15.M2 | M | **Extra:** uma operação por função com `local`. | Após tópico **9** (funções). |
| 15.M3 | M | **Extra:** validar operandos numéricos. | stderr se inválido. |

---

## 16. tmux *(opcional)* — [tmux/tmux.md](../tmux/tmux.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 16.F1 | F | Criar sessão `estudo`, desconectar, reconectar. | `tmux new -s estudo`, detach, attach. |
| 16.I1 | I | Dois painéis: `tail -f` em log e editor. | Navegação entre painéis. |

---

## 17. shell sessões *(opcional)* — [shell/sessoes.md](../shell/sessoes.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 17.F1 | F | Rode `tty` local e (se possível) via `ssh`. | Comparar `/dev/pts/N`. |
| 17.I1 | I | Empilhar shells; testar `export` e `exit`. | Comportamento documentado. |

---

## 18. trap — [trap/trap.md](../trap/trap.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 18.F1 | F | `trap EXIT` + `mktemp`; arquivo removido ao sair. | Gabarito: [16-trap-cleanup.sh](solucoes/16-trap-cleanup.sh). |
| 18.F2 | F | `trap SIGINT` durante `sleep 30`. | Ctrl+C limpa e mensagem em stderr. |
| 18.I1 | I | Integrar `trap` na integradora (estágio 20.M5). | Sem `.tmp` órfão após Ctrl+C. |

---

## 19. ssh — [ssh/ssh.md](../ssh/ssh.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 19.F1 | F | `ssh usuario@host 'hostname'` (ver [ssh-lab.md](ssh-lab.md)). | Exit code 0. |
| 19.I1 | I | Alias em `~/.ssh/config`. | `ssh meuservidor` sem repetir host na CLI. |
| 19.D1 | D | `check_remoto.sh HOST` — diretório remoto existe? | Gabarito: [17-check-remoto.sh](solucoes/17-check-remoto.sh). |
| 19.D2 | D | `scp` do `integradora/script.sh` para `/tmp` no remoto. | `md5sum` local vs remoto. |

*Sem servidor:* [ssh-lab.md](ssh-lab.md) — localhost, Docker ou VM.

---

## 20. Marco — Integradora de logs (por estágios)

Base: [pratica/integradora/](../pratica/integradora/). Siga **M1 → M5** antes dos extras.

| ID | Nível | Estágio | O que fazer | Critério de aceite |
|----|-------|---------|-------------|-------------------|
| 20.M1 | M | Rodar o base | Entender `script.sh` e saída. | Linhas `timestamp - TAG - texto`. |
| 20.M2 | M | Entrada e stderr | Entrada ausente → stderr + `input_error_log.txt`. | Falha visível. |
| 20.M3 | M | Saída gravável | Log não gravável → stderr claro. | Teste com `chmod 000` (restaurar depois). |
| 20.M4 | M | Log de erros | Tags `ERROR` em `error_log.txt`. | Subset consistente com log principal. |
| 20.M5 | M | Robustez | `trap` + opcional `set -euo pipefail`. | Ver [robustez.md](../fluxos/robustez.md). |
| 20.M6 | M | Extra | Rotação de log ou múltiplas fontes. | Documentado. |
| 20.M7 | M | Extra | Relatório com `grep`/`awk` (tópico **12**). | `relatorio_log.sh` ou equivalente. |

---

## Checklist de progresso

Marque conforme for concluindo (critério: critérios de aceite ok).

```
Fundamentos
[ ] 1.F–I   shell
[ ] 2.F–I   entrada_usuario
[ ] 3.F–D   pipe

Sintaxe
[ ] 4.F–D   condicional
[ ] 5.F–I   calculos
[ ] 6.F–I   case
[ ] 7.F–I   loop for
[ ] 8.F–I   loop while

Estrutura e dados
[ ] 9.F–I   funcoes
[ ] 10.F–D  redirecionamento
[ ] 11.F–D  IFS
[ ] 12.F–D  texto (grep/sed/awk)
[ ] 13.F–D  arrays
[ ] 14.F–I  robustez (set -euo pipefail)

Projetos e ops
[ ] 15.M    calculadora (M1 mínimo; M2–M3 extras)
[ ] 16–17   tmux / sessoes (opcional)
[ ] 18.F–I  trap
[ ] 19.F–D  ssh (+ ssh-lab)
[ ] 20.M1–M5 integradora (mínimo viável)
[ ] 20.M6–M7 integradora (extras)
```

---

## Recursos do repositório

| Recurso | Caminho |
|---------|---------|
| Exercícios por pasta | `<topico>/exercicios.md` |
| Gabaritos | [pratica/solucoes/](solucoes/README.md) |
| Validar sintaxe dos gabaritos | `bash pratica/validar-solucoes.sh` |
| SSH sem nuvem | [pratica/ssh-lab.md](ssh-lab.md) |
