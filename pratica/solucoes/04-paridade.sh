#!/usr/bin/env bash
read -rp "Digite um número inteiro: " n

if ! [[ "$n" =~ ^-?[0-9]+$ ]]; then
  echo "Entrada inválida: esperado número inteiro." >&2
  exit 1
fi

if (( n % 2 == 0 )); then
  echo "Par"
else
  echo "Ímpar"
fi
