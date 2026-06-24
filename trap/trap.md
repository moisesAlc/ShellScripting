# ⚡ Trap

O comando `trap` define ações executadas quando o script recebe **sinais** ou termina. Serve para limpeza (arquivos temporários), resposta a Ctrl+C e comportamento ao encerrar a sessão (incluindo queda de SSH — ver [SIGHUP](#sighup)).

## Sinais comuns

| Sinal | Quando ocorre |
|-------|----------------|
| `SIGINT` | Ctrl+C no terminal |
| `SIGTERM` | Pedido de encerramento (`kill PID`) |
| `EXIT` | Script termina (sucesso ou erro) — não é sinal POSIX, extensão do Bash |
| `SIGHUP` | Terminal fechado ou conexão SSH caiu — ver [SSH](../ssh/ssh.md) e [TTY/PTY](../shell/sessoes.md) |

## Sintaxe

```bash
trap 'comandos' SINAL
trap -p                    # listar traps ativos
trap - SINAL               # remover handler
```

Os comandos ficam entre **aspas simples** para evitar expansão prematura de variáveis (ou use funções com cuidado).

## Capturar Ctrl+C

```bash
trap 'echo "Interrompido." >&2; exit 130' SIGINT

while true; do
  sleep 1
done
```

Exit `130` é convenção comum após SIGINT (128 + 2).

## Limpeza ao sair (`EXIT`)

```bash
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

# use $tmp; ao sair (normal ou erro), o arquivo some
```

## Ignorar um sinal

```bash
trap '' SIGINT    # Ctrl+C ignorado neste script
```

Use com moderação — o usuário pode ficar preso.

## Boas práticas

- Mantenha o corpo do `trap` **simples** (rm, echo, exit).
- Combine `trap` com [robustez](../fluxos/robustez.md) (`set -euo pipefail`) na integradora.
- Teste Ctrl+C e `exit` normal.

## Exercícios

IDs **18.F1–18.I1** em [exercicios.md](exercicios.md) e [PLANO-EXERCICIOS.md](../pratica/PLANO-EXERCICIOS.md). Gabarito: [16-trap-cleanup.sh](../pratica/solucoes/16-trap-cleanup.sh).

## ➡️ Próximo passo

[SSH](../ssh/ssh.md) — shell remoto e automação.

🔙 [Voltar ao índice](../README.md)
