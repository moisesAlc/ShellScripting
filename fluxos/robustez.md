# Robustez em scripts

Scripts que rodam em cron, CI ou servidores precisam **falhar de forma previsível** e **não continuar em silêncio** quando algo dá errado. Este tópico fecha a lacuna entre pipelines simples e scripts de produção.

## Exit codes

Todo comando termina com um código (0 = sucesso, ≠ 0 = falha). O script herda o código do **último** comando executado.

```bash
grep ERRO arquivo.log
echo $?   # 0 se achou, 1 se não achou (grep), 2 se arquivo inválido
```

Em scripts:

```bash
if ! grep -q ERRO "$log"; then
  echo "Nenhum erro encontrado" >&2
  exit 1
fi
```

## `set -e` — parar ao primeiro erro

Por padrão, o Bash **continua** mesmo se um comando falhar. Com `set -e` (ou `set -o errexit`), o script encerra na primeira falha:

```bash
#!/usr/bin/env bash
set -e
rm /caminho/inexistente   # script para aqui
echo "não executa"
```

**Exceções comuns:** comandos em `if`, `||`, `&&` e alguns pipelines não disparam `set -e` da mesma forma — teste o seu caso.

## `set -u` — variável indefinida é erro

```bash
set -u
echo "$variavel_que_nao_existe"   # erro e exit com set -e também ativo
```

Evita typos em nomes de variáveis (`$nme` em vez de `$nome`).

## `set -o pipefail` — falha no meio do pipe

Sem `pipefail`, o exit code de `cmd1 | cmd2` é só o de **cmd2**:

```bash
# Sem pipefail: grep falha, wc "sucesso" → exit 0 enganoso
grep ERRO /nao/existe | wc -l
echo $?
```

Com pipefail:

```bash
set -o pipefail
grep ERRO /nao/existe | wc -l
echo $?   # reflete falha do grep
```

## Combinação recomendada

```bash
#!/usr/bin/env bash
set -euo pipefail
```

Use no topo de scripts novos (integradora, deploy, backup). Em scripts legados, ative por partes e teste — pode expor bugs antes mascarados.

## Quando **não** usar tudo ligado

- Scripts que tratam falha manualmente (`if cmd; then ...`) em todo lugar.
- Comandos onde falha é esperada (`grep` sem match) — use `if grep ... || true` ou `grep ... && ...` com cuidado.
- Trechos interativos onde o usuário pode cancelar.

## Relação com outros tópicos

- Pipelines: [pipe/pipe.md](../pipe/pipe.md) (menção a `pipefail`).
- stderr e logs: [redirecionamento.md](redirecionamento.md).
- Limpeza ao sair com erro: [trap/trap.md](../trap/trap.md).
- Exercícios: [fluxos/exercicios.md](exercicios.md), [PLANO-EXERCICIOS.md](../pratica/PLANO-EXERCICIOS.md).

## ➡️ Próximo passo

[tmux/tmux.md](../tmux/tmux.md) *(opcional)* ou [trap/trap.md](../trap/trap.md).

🔙 [Voltar ao índice](../README.md)
