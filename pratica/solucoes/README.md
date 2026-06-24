# Gabaritos de referência

Soluções **exemplificativas** para parte do [PLANO-EXERCICIOS.md](../PLANO-EXERCICIOS.md). Use para comparar depois de tentar sozinho — não copie sem entender.

## Como validar

```bash
# Sintaxe de todos os gabaritos
bash pratica/validar-solucoes.sh

# Um script específico
bash -n pratica/solucoes/04-paridade.sh
bash pratica/solucoes/04-paridade.sh   # teste manual
```

## Índice

| Arquivo | Exercício | O que demonstra |
|---------|-----------|-----------------|
| [02-saudacao.sh](02-saudacao.sh) | 2.F1 | `read -p`, aspas em `"$nome"` |
| [04-paridade.sh](04-paridade.sh) | 4.F1 | `if`, validação numérica, stderr |
| [03-resumo_log.sh](03-resumo_log.sh) | 3.D1 | `$1`, `grep -c`, arquivo ausente |
| [16-trap-cleanup.sh](16-trap-cleanup.sh) | 16.F1 | `trap` + `EXIT` + `mktemp` |
| [17-check-remoto.sh](17-check-remoto.sh) | 17.D1 | `ssh` com exit code (host configurável) |

## Suas soluções

Salve em `pratica/minha-solucao/<topico>/` (pasta local, fora do git). Compare com os gabaritos linha a linha.

## Testes automatizados (opcional)

Este repositório não exige [bats](https://github.com/bats-core/bats-core) nem shunit2. Para ir além: instale bats e escreva `*.bats` que chamem seus scripts e verifiquem `$?` e saída.
