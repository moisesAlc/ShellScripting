#!/usr/bin/env bash
arquivo="${1:-}"

if [[ -z "$arquivo" ]]; then
  echo "Uso: $0 <arquivo-log>" >&2
  exit 1
fi

if [[ ! -f "$arquivo" ]]; then
  echo "Arquivo não encontrado: $arquivo" >&2
  exit 1
fi

total=$(wc -l < "$arquivo")
erros=$(grep -c ERRO "$arquivo" || true)
infos=$(grep -c INFO "$arquivo" || true)

echo "Linhas: $total"
echo "ERRO: $erros"
echo "INFO: $infos"
