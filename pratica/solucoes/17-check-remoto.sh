#!/usr/bin/env bash
# Gabarito 17.D1 — requer SSH funcionando (veja pratica/ssh-lab.md)
host="${1:-localhost}"
dir_remoto="${2:-/tmp}"

if ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" "test -d '$dir_remoto'"; then
  echo "OK: diretório $dir_remoto existe em $host"
  exit 0
else
  echo "FALHA: diretório $dir_remoto inexistente ou SSH indisponível em $host" >&2
  exit 1
fi
