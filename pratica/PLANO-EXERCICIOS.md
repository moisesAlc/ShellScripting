# Plano de exercícios

Roteiro de prática alinhado à [ordem de estudo](../README.md). Cada tópico traz exercícios **curtos** (fixação) e, quando couber, um **desafio** um pouco maior. Projetos (`calculadora`, `integradora`) aparecem como marcos.

## Como usar

1. Leia o tópico teórico (`.md` na pasta correspondente).
2. Faça os exercícios na ordem; pule só se já dominar o assunto.
3. Salve seus scripts em `pratica/minha-solucao/<topico>/` (crie a pasta localmente; não precisa versionar).
4. Antes de entregar para si mesmo: `bash -n script.sh` e teste com entrada normal, vazia e inválida quando fizer sentido.

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

*Aprofundamento opcional:* [shell/sessoes.md](../shell/sessoes.md) — exercícios na seção 15 abaixo.

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

## 9. Marco — Calculadora — [pratica/calculadora/](../pratica/calculadora/)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 9.M1 | M | Implemente ou compare com `calculadora.sh`: menu, quatro operações, sair. | Divisão por zero tratada; loop até opção sair. |
| 9.M2 | M | **Extra:** uma operação por função com `local` nas variáveis internas. | Refatorar após ler [funcoes/funcoes.md](../funcoes/funcoes.md) (item 10). |
| 9.M3 | M | **Extra:** validar que operandos são números antes de calcular. | Mensagem em stderr se inválido. |

*Nota:* Se ainda não leu funções, faça 9.M1 com código linear; volte em 9.M2 depois do tópico 10.

---

## 10. funcoes — [funcoes/funcoes.md](../funcoes/funcoes.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 10.F1 | F | Função `saudacao()` que usa `$1` e `echo`. | Chamar três vezes com nomes diferentes. |
| 10.F2 | F | Função com `local` que não altera variável global homônima. | Demonstrar com `echo` antes/depois. |
| 10.I1 | I | Extrair validação numérica para `eh_numero()` usada em 5.I1 ou 9.M3. | Reutilização em pelo menos dois pontos do script. |

---

## 11. redirecionamento — [fluxos/redirecionamento.md](../fluxos/redirecionamento.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 11.F1 | F | `comando_inexistente 2> erros.txt` — confira o arquivo. | stderr capturado; stdout não misturado. |
| 11.F2 | F | Redirecione stdout e stderr para arquivos **diferentes** no mesmo comando. | Dois arquivos com conteúdo correto. |
| 11.I1 | I | Script `duplica_log.sh`: copia stdin para dois arquivos (`tee` ou redirecionamento). | Teste: `echo teste \| bash duplica_log.sh a.txt b.txt`. |
| 11.D1 | D | Wrapper: `bash roda.sh script.sh` grava stdout em `saida.log` e stderr em `erro.log`. | Exit code do script filho preservado (`$?`). |

---

## 12. IFS — [fluxos/IFS.md](../fluxos/IFS.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 12.F1 | F | Ler `/etc/passwd` (ou arquivo fake CSV): imprimir só o primeiro campo por linha. | `IFS=:` ou `IFS=,` conforme arquivo. |
| 12.I1 | I | Script que soma a terceira coluna de um CSV de três colunas. | `while IFS=, read -r c1 c2 c3`. |
| 12.D1 | D | Converter `pipe/log.txt` em resumo: tipo (palavra antes do `:`) e contagem por tipo. | Saída tabular simples. |

---

## 13. arrays — [arrays/arrays.md](../arrays/arrays.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 13.F1 | F | Array de 5 frutas; imprimir todas com `${frutas[@]}`. | Índice e tamanho `${#frutas[@]}`. |
| 13.I1 | I | Sorteio: array de nomes (`INFO`, `WARN`, `ERROR`); escolha aleatória como na integradora. | Mesma ideia de `indice=$(($RANDOM % ${#arr[@]}))`. |
| 13.D1 | D | Script que recebe N números como argumentos e imprime min, max e média (Bash 4+). | Sem `bc` se usar só inteiros; com `bc` se média decimal. |

---

## 14. tmux *(opcional)* — [tmux/tmux.md](../tmux/tmux.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 14.F1 | F | Criar sessão `estudo`, desconectar, reconectar. | `tmux new -s estudo`, detach, `tmux attach -t estudo`. |
| 14.I1 | I | Dois painéis: um com `tail -f` em log, outro com editor. | Navegação entre painéis sem fechar sessão. |

---

## 15. shell sessões *(opcional)* — [shell/sessoes.md](../shell/sessoes.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 15.F1 | F | Rode `tty` no terminal local e (se possível) dentro de `ssh` remoto. | Comparar `/dev/pts/N` vs console. |
| 15.I1 | I | Empilhe `zsh`/`bash` (ou dois bash): `export VAR=1`, entre no subshell, mude `VAR`, `exit`, verifique valor no pai. | Comportamento documentado em comentário. |

---

## 16. trap — [trap/trap.md](../trap/trap.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 16.F1 | F | Script que cria `/tmp/meu_teste_$$.txt`, `trap` no `EXIT` remove o arquivo. | Arquivo some ao terminar normalmente. |
| 16.F2 | F | Mesmo script: `trap` em `SIGINT` (Ctrl+C) limpa e sai com mensagem. | Testar interrupção no meio de `sleep 30`. |
| 16.I1 | I | Integrar `trap` na integradora (milestone M3 abaixo): limpar temp ou restaurar trap ao sair. | Sem arquivos `.tmp` órfãos após Ctrl+C. |

---

## 17. ssh — [ssh/ssh.md](../ssh/ssh.md)

| ID | Nível | Exercício | Critério de aceite |
|----|-------|-----------|-------------------|
| 17.F1 | F | Conectar a um host (ou `localhost` se configurado) com `ssh usuario@host 'hostname'`. | Exit code 0; saída é o hostname remoto. |
| 17.I1 | I | Entrada em `~/.ssh/config` para um alias `meuservidor`. | `ssh meuservidor` funciona sem repetir usuário/host na linha de comando. |
| 17.D1 | D | `check_remoto.sh HOST`: testa se diretório existe remotamente (`ssh … 'test -d …'`), imprime ok/falha e usa exit code. | `BatchMode=yes` ou documentar necessidade de chave. |
| 17.D2 | D | Copiar `pratica/integradora/script.sh` para `/tmp` no remoto com `scp`. | Arquivo idêntico (`diff` ou `md5sum`). |

*Sem servidor:* use segunda máquina, VM, WSL↔Windows host ou container local; documente o ambiente no README da sua solução.

---

## 18. Marco — Integradora de logs (por estágios)

Base: [pratica/integradora/](../pratica/integradora/). Não implemente tudo de uma vez — siga **M1 → M5**.

| ID | Nível | Estágio | O que fazer | Critério de aceite |
|----|-------|---------|-------------|-------------------|
| 18.M1 | M | Rodar o base | Entender `script.sh`, `lorem_ipsum.txt`, saída em `log_output.txt`. | Gera linhas `timestamp - TAG - texto`. |
| 18.M2 | M | Entrada e stderr | Se entrada ausente: mensagem em **stderr** + registro em `input_error_log.txt` + exit ≠ 0. | `bash script.sh` com arquivo renomeado falha de forma visível. |
| 18.M3 | M | Saída gravável | Se não puder escrever em `log_output.txt`: stderr claro, sem falha silenciosa. | Teste com `chmod 000` no log (restaurar depois). |
| 18.M4 | M | Log de erros | Linhas com tag `ERROR` (ou `ERRO`) também em `error_log.txt`. | `grep ERROR error_log.txt` bate com subset do log principal. |
| 18.M5 | M | Robustez | `trap` no `EXIT`/`SIGINT`; opcional: `set -euo pipefail` onde fizer sentido. | Ctrl+C não deixa processo pendurado; temp limpo. |
| 18.M6 | M | Extra | Rotação: se `log_output.txt` > N linhas, renomear para `.old` e recomeçar. | Ou segundo arquivo de entrada; documentar escolha. |
| 18.M7 | M | Extra | Filtro: relatório `grep`/`awk` com contagem por tag a partir do log gerado. | Script ou one-liner documentado no README da solução. |

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

Consolidação
[ ] 9.M     calculadora (M1 mínimo)
[ ] 10.F–I  funcoes (+ 9.M2 se refatorou)
[ ] 11.F–D  redirecionamento
[ ] 12.F–D  IFS
[ ] 13.F–D  arrays

Ops e projetos
[ ] 14–15   tmux / sessoes (opcional)
[ ] 16.F–I  trap
[ ] 17.F–D  ssh (se tiver host)
[ ] 18.M1–M5 integradora (mínimo viável)
[ ] 18.M6–M7 integradora (extras)
```

---

## O que vem depois deste plano

Quando os marcos M estiverem estáveis, o material pode ganhar:

- Arquivos `exercicios.md` por pasta (só o recorte daquele tópico).
- Pasta `pratica/solucoes/` com gabaritos opcionais (ou links para branches).
- Reordenação do README alinhada a funções → fluxos → calculadora.

Por ora, este arquivo é o **mapa único** de exercícios do repositório.
