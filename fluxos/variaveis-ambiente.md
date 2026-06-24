# Variáveis de ambiente

**Variáveis de ambiente** são pares `NOME=valor` visíveis para o shell e para os **processos filhos** que ele inicia. Servem para configurar comportamento (onde buscar comandos, qual editor usar, credenciais de API) sem hardcodar tudo no script.

Diferente de variáveis **locais** do script (`nome="x"`), o ambiente é compartilhado com programas que você chama — `grep`, `ssh`, `python`, etc.

## Ver e listar

```bash
echo "$HOME"
echo "$PATH"
printenv | grep PATH
env | sort | less
```

Variáveis comuns:

| Variável | Significado |
|----------|-------------|
| `HOME` | Diretório do usuário |
| `USER` / `LOGNAME` | Nome de login |
| `SHELL` | Shell de login configurado |
| `PATH` | Pastas onde o sistema procura executáveis |
| `PWD` | Diretório atual |
| `OLDPWD` | Diretório anterior (`cd -`) |
| `HOSTNAME` | Nome da máquina (em muitas distros) |
| `EDITOR` / `VISUAL` | Editor padrão para programas que abrem texto |

## Definir: sessão vs exportar

```bash
local_only=1          # só neste shell (não vai para filhos)
export PUBLICA=1      # shell atual + processos filhos
```

Teste a diferença:

```bash
export EXPORTADA=sim
INTERNA=nao
bash -c 'echo EXPORTADA=$EXPORTADA INTERNA=$INTERNA'
# EXPORTADA=sim INTERNA=
```

Em scripts, use `export` quando um **subcomando** precisa da variável:

```bash
export LOG_LEVEL=debug
./outro_script.sh
```

## Ler no script com padrão

Parâmetro de ambiente com **valor padrão** se não estiver definido:

```bash
#!/usr/bin/env bash
arquivo_log="${LOG_FILE:-/var/log/app.log}"
porta="${PORT:-8080}"
modo="${MODO:-producao}"

echo "Log: $arquivo_log (porta $porta, modo $modo)"
```

Outras expansões úteis:

```bash
# Erro se não definida (com set -u, acessar $VAR vazia quebra)
: "${API_KEY:?Defina API_KEY no ambiente}"

# Atribuir default só se vazia ou unset
timeout="${TIMEOUT:=30}"
```

Veja [robustez.md](robustez.md) para `set -u`.

## Arquivo de configuração simples

### Exportar de um arquivo (sourcing)

Arquivo `app.env` (não commitar segredos):

```bash
export APP_NAME="minha-app"
export LOG_DIR="/tmp/logs"
export DEBUG=0
```

Carregar no shell ou no script:

```bash
set -a                  # tudo que definir vira export automaticamente
# shellcheck source=app.env
source ./app.env
set +a
```

Ou, no início do script:

```bash
if [[ -f "$CONFIG_FILE" ]]; then
  # shellcheck source=/dev/null
  source "$CONFIG_FILE"
fi
```

### Formato `KEY=VALUE` (sem `export`)

Muitas ferramentas (Docker, systemd, dotenv) usam linhas `CHAVE=valor`. No Bash puro, ao dar `source`, prefira `export` em cada linha ou `set -a` antes do `source`.

## `PATH` e executáveis

O sistema procura comandos nas pastas de `PATH`, separadas por `:`.

```bash
echo "$PATH" | tr ':' '\n'
export PATH="$HOME/bin:$PATH"   # prepend — vale para esta sessão/filhos
```

Em scripts instaláveis, evite sobrescrever `PATH` inteiro; **adicione** pastas.

## Herança e subshell

- `VAR=1 comando` — `VAR` só existe para aquele comando (não polui o shell).
- `( cd /tmp )` — subshell: `cd` não afeta o pai.
- `export` no pai → filhos veem; alteração **sem** export no filho não volta ao pai.

Relacionado: [shell/sessoes.md](../shell/sessoes.md) (empilhamento de shells).

## Ambiente em SSH e cron

**SSH:** variáveis do seu laptop **não** vão automaticamente para o servidor. No remoto, defina env no script ou em `~/.bashrc`. Detalhes: [variaveis-ambiente.md](../fluxos/variaveis-ambiente.md).

**Cron:** ambiente **mínimo** — `PATH` curto, sem `HOME` completo às vezes. Scripts em cron devem usar caminhos **absolutos** e, se precisar, definir variáveis no topo do script ou no crontab:

```cron
LOG_DIR=/var/log/minha-app
0 * * * * /opt/scripts/backup.sh
```

## Segurança

- **Não** coloque senhas ou tokens em scripts versionados no Git.
- Prefira variáveis de ambiente ou arquivos com permissão restrita (`chmod 600`) fora do repo.
- `env | grep -i pass` — cuidado ao depurar (saída pode ir para log).
- `readonly API_URL="https://..."` impede reassignment acidental no script.

## `unset` e `readonly`

```bash
unset VAR_TEMP
readonly VERSAO_SCRIPT="1.0"
# VERSAO_SCRIPT=2   # erro
```

## Boas práticas em scripts

1. Nomes em **MAIÚSCULAS** para env (`LOG_LEVEL`); minúsculas para variáveis internas (`contador`).
2. Sempre cite: `"$LOG_DIR"`, não `$LOG_DIR`.
3. Documente no README do script quais variáveis são opcionais/obrigatórias.
4. Forneça defaults com `${VAR:-padrao}`.
5. Valide obrigatórias com `${VAR:?mensagem}`.

## Exemplo integrado

```bash
#!/usr/bin/env bash
set -euo pipefail

: "${APP_ENV:?Defina APP_ENV (ex.: dev, staging, prod)}"
log_dir="${LOG_DIR:-./logs}"
mkdir -p "$log_dir"

echo "[${APP_ENV}] gravando em $log_dir" | tee -a "$log_dir/run.log"
```

## Exercícios

IDs **15.F1–15.D1** em [exercicios.md](exercicios.md) e [PLANO-EXERCICIOS.md](../pratica/PLANO-EXERCICIOS.md).

## ➡️ Próximo passo

[pratica/calculadora/](../pratica/calculadora/) — projeto que consolida sintaxe antes dos tópicos de ops.

🔙 [Voltar ao índice](../README.md)
