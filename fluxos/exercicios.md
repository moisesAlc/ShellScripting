# Exercícios — fluxos (I/O e robustez)

[PLANO-EXERCICIOS.md](../pratica/PLANO-EXERCICIOS.md) (seções **10**, **11**, **14** e **15**).

### Redirecionamento (teoria: [redirecionamento.md](redirecionamento.md))

| ID | Nível | Resumo |
|----|-------|--------|
| 10.F1 | F | stderr em arquivo |
| 10.F2 | F | stdout e stderr separados |
| 10.I1 | I | `duplica_log.sh` / `tee` |
| 10.D1 | D | `roda.sh` com logs de saída |

### IFS (teoria: [IFS.md](IFS.md))

| ID | Nível | Resumo |
|----|-------|--------|
| 11.F1 | F | Primeiro campo de `/etc/passwd` ou CSV |
| 11.I1 | I | Soma coluna CSV |
| 11.D1 | D | Resumo de `log.txt` por tipo |

### Robustez (teoria: [robustez.md](robustez.md))

| ID | Nível | Resumo |
|----|-------|--------|
| 14.F1 | F | Script com `set -euo pipefail` que falha de propósito |
| 14.I1 | I | Pipeline com `pipefail` vs sem |

### Variáveis de ambiente (teoria: [variaveis-ambiente.md](variaveis-ambiente.md))

| ID | Nível | Resumo |
|----|-------|--------|
| 15.F1 | F | `HOME`, `USER`, `PATH` |
| 15.F2 | F | `export` vs variável local no filho |
| 15.I1 | I | `NOME="${NOME:-visitante}"` |
| 15.D1 | D | `source` de `CONFIG_FILE` |

Essencial antes da [integradora](../pratica/integradora/) estágios M3–M5 e M8.
