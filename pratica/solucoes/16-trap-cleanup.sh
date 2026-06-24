#!/usr/bin/env bash
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

echo "PID $$ — arquivo temporário: $tmp"
echo "teste" > "$tmp"
sleep 30
