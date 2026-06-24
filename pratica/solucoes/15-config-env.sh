#!/usr/bin/env bash
# Gabarito 15.D1 — carrega app.env via CONFIG_FILE
set -euo pipefail

config="${CONFIG_FILE:-./app.env}"

if [[ ! -f "$config" ]]; then
  echo "Arquivo de configuração não encontrado: $config" >&2
  exit 1
fi

set -a
# shellcheck source=/dev/null
source "$config"
set +a

echo "APP_NAME=${APP_NAME:-(não definido)}"
echo "LOG_DIR=${LOG_DIR:-(não definido)}"
