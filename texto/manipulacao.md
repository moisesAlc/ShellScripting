# Manipulação de texto

Ferramentas de linha de comando para filtrar e transformar texto — complemento natural de [pipe/pipe.md](../pipe/pipe.md) e da [integradora de logs](../pratica/integradora/).

## `grep` — filtrar linhas

```bash
grep ERRO pipe/log.txt              # linhas com ERRO
grep -c INFO pipe/log.txt           # contagem
grep -v WARN pipe/log.txt           # linhas sem WARN
grep -E 'ERRO|WARN' pipe/log.txt    # regex estendida
```

Em scripts, `-q` (quiet) só testa existência:

```bash
if grep -q ERROR "$arquivo_log"; then
  echo "Há erros no log" >&2
fi
```

## `sed` — substituir e extrair

Substituição na primeira ocorrência por linha:

```bash
sed 's/ERRO/ERROR/g' pipe/log.txt
```

Imprimir intervalo de linhas (linhas 2–5):

```bash
sed -n '2,5p' pipe/log.txt
```

**Cuidado:** em scripts, prefira variáveis citadas; `sed` interpreta `/` no padrão — use outro delimitador: `sed 's|old|new|g'`.

## `awk` — colunas e relatórios

Trata linhas em **campos** (padrão: espaços). A integradora gera linhas no formato `timestamp - TAG - mensagem`.

Contar por tag (campo 3 se separador for ` - ` — exemplo simplificado com espaço):

```bash
awk '{print $3}' pratica/integradora/log_output.txt | sort | uniq -c | sort -nr
```

Soma da segunda coluna em CSV:

```bash
awk -F',' '{s+=$2} END {print s}' dados.csv
```

Só linhas com tag ERROR (exemplo com separador fixo):

```bash
awk -F' - ' '$2 == "ERROR" {print}' pratica/integradora/log_output.txt
```

## Combinando com pipes

```bash
grep ERROR pratica/integradora/log_output.txt \
  | awk -F' - ' '{print $1, $3}' \
  | sort
```

## Dentro do Bash vs. externo

- **One-liners** em pipeline: `grep`, `sed`, `awk` são ideais.
- **Lógica de negócio** complexa: considere funções Bash ou `awk` em arquivo `.awk` separado.
- Para integradora M7: um relatório com `grep` + `awk` + `sort` costuma bastar.

## Erros comuns

- Esquecer aspas em `"$arquivo"` — glob expande ou quebra com espaços no path.
- `awk` com separador errado — inspecione a linha com `head -1 arquivo`.
- `sed -i` sem backup em produção — teste sem `-i` antes.

## ➡️ Próximo passo

[pratica/calculadora/](../pratica/calculadora/) ou, se já passou por ela, [fluxos/robustez.md](../fluxos/robustez.md).

🔙 [Voltar ao índice](../README.md)
