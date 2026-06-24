# 🔐 SSH

**SSH** (*Secure Shell*) é o protocolo padrão para **shell remoto** e execução de comandos em outra máquina pela rede, com criptografia. Do ponto de vista do shell scripting, o SSH abre no servidor remoto o mesmo tipo de sessão que um terminal local: um **PTY** com um interpretador (Bash, etc.). Conceitos de canal em [Shell: TTY e PTY](../shell/sessoes.md).

```text
[Sua máquina]  ssh  →  [Servidor remoto: PTY + shell]
```

## 🔐 Primeira conexão

```bash
ssh usuario@hostname
# ou, se a porta não for 22:
ssh -p 2222 usuario@hostname
```

Na **primeira** vez que você conecta a um host, o cliente mostra a **impressão digital** da chave do servidor e pede confirmação. Ao aceitar, o host entra em `~/.ssh/known_hosts`. Isso evita ataques *man-in-the-middle* em conexões futuras.

```bash
ssh-keygen -lf ~/.ssh/known_hosts   # listar fingerprints conhecidos
ssh-keygen -R hostname              # remover host após troca de servidor/chave
```

## 🔑 Autenticação: senha e chave pública

| Método | Uso | Observação |
|--------|-----|------------|
| **Senha** | Login interativo | Simples; ruim para automação e scripts |
| **Chave pública** | Padrão em servidores e CI | Par privada (sua máquina) + pública em `~/.ssh/authorized_keys` no servidor |

Gerar par de chaves (Ed25519 recomendado):

```bash
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
# arquivos padrão: ~/.ssh/id_ed25519 (privada) e id_ed25519.pub (pública)
```

Copiar a chave pública para o servidor (uma das formas):

```bash
ssh-copy-id usuario@hostname
# ou manualmente: append do conteúdo de id_ed25519.pub em ~/.ssh/authorized_keys no remoto
```

**Permissões** no servidor (SSH costuma recusar se estiverem abertas demais):

```text
~/.ssh/           → 700
~/.ssh/authorized_keys → 600
```

### 🔹 ssh-agent

Evita digitar a passphrase da chave privada a cada conexão:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add -l    # chaves carregadas
```

## ⚙️ Arquivo `~/.ssh/config`

Centraliza hosts, usuários, chaves e atalhos:

```sshconfig
Host meuservidor
    HostName 192.168.1.10
    User deploy
    Port 22
    IdentityFile ~/.ssh/id_ed25519

Host *.lab.local
    User aluno
    StrictHostKeyChecking accept-new
```

Depois:

```bash
ssh meuservidor          # equivale a ssh deploy@192.168.1.10
scp arquivo.txt meuservidor:/tmp/
```

Opções úteis em scripts (use com cuidado):

| Opção | Efeito |
|-------|--------|
| `StrictHostKeyChecking=no` | Não pergunta fingerprint — **inseguro** em produção |
| `BatchMode=yes` | Falha em vez de pedir senha — bom para automação |
| `ConnectTimeout=10` | Limita espera na conexão |

## ⌨️ Comando remoto (sem shell interativo)

O SSH pode executar **um comando** e encerrar — padrão em scripts e cron remotos:

```bash
ssh usuario@hostname 'hostname && uptime'
ssh usuario@hostname "cd /var/log && ls -la *.log | tail -5"
```

Regras de aspas:

- Comando entre **aspas simples** no cliente: o remoto recebe o texto literal (variáveis locais **não** expandem).
- **Aspas duplas**: variáveis **locais** expandem antes do envio; use quando quiser passar valores do script atual.

```bash
arquivo="app.log"
ssh usuario@hostname "grep ERROR /var/log/$arquivo"
```

O **código de saída** do comando remoto é o código de saída do `ssh` (útil com `if ssh ...; then`).

## 📁 Copiar arquivos: `scp` e `rsync`

**scp** — cópia simples sobre SSH:

```bash
scp local.txt usuario@hostname:/tmp/
scp usuario@hostname:/var/log/syslog ./logs/
scp -r ./pasta usuario@hostname:/opt/app/
```

**rsync** — sincronização incremental (também usa SSH por padrão):

```bash
rsync -avz --progress ./build/ usuario@hostname:/var/www/app/
rsync -avz -e "ssh -p 2222" ./dados/ usuario@hostname:~/backup/
```

Para scripts de deploy, `rsync` costuma ser preferível quando há muitos arquivos ou reexecuções frequentes.

## 📜 SSH em scripts Bash

Exemplo mínimo com verificação de saída:

```bash
#!/usr/bin/env bash
set -euo pipefail

HOST="meuservidor"
REMOTE_DIR="/opt/app"

if ! ssh -o BatchMode=yes "$HOST" "test -d $REMOTE_DIR"; then
  echo "Diretório remoto inexistente: $REMOTE_DIR" >&2
  exit 1
fi

ssh "$HOST" "cd $REMOTE_DIR && bash scripts/backup.sh"
```

### 🔹 Armadilhas comuns em scripts

1. **Host key em CI** — o runner não tem `known_hosts`; configure chave do servidor de forma explícita ou use `ssh-keyscan` **uma vez** no setup (nunca desative verificação em produção sem motivo).
2. **Variáveis e quoting** — comando remoto mal citado quebra com espaços ou `$(...)` indesejado; prefira argumentos ou heredoc remoto para trechos longos.
3. **Caminhos locais vs remotos** — `scp ./x host:~/` envia local; `ssh host 'cat ~/x'` lê remoto.
4. **Shell remoto ≠ local** — o shebang e o `PATH` do servidor podem diferir; não assuma Bash 5+ nem mesmas ferramentas.
5. **`set -e` e ssh** — em pipelines, falha remota pode não abortar o script como você espera; teste o exit code explicitamente.

Heredoc remoto (comando multilinha):

```bash
ssh usuario@hostname 'bash -s' <<'EOF'
set -euo pipefail
echo "Rodando no: $(hostname)"
df -h /tmp
EOF
```

O `'bash -s'` no remoto lê o script do stdin; `<<'EOF'` evita expansão local indesejada.

## 🪟 Sessões longas e desconexão

Fechar o laptop ou cair a rede envia **SIGHUP** ao shell remoto — jobs podem morrer. Para trabalho interativo longo, use [tmux](../tmux/tmux.md) (ou `screen`) **no servidor**:

```bash
ssh usuario@hostname
tmux new -s trabalho
# ... desconecte e reconecte depois:
tmux attach -t trabalho
```

Em scripts que precisam sobreviver à desconexão, o padrão é `nohup`, `disown` ou agendador no remoto — não depender da sessão SSH interativa. Relação com sinais: [trap](../trap/trap.md) (`SIGHUP`, `EXIT`).

## 🔀 Bastion (ProxyJump)

Quando só um host “salto” na rede aceita SSH e o destino está atrás dele:

```sshconfig
Host bastion
    HostName jump.exemplo.com
    User admin

Host app-interno
    HostName 10.0.0.5
    User deploy
    ProxyJump bastion
```

```bash
ssh app-interno    # conexão em dois saltos, transparente para você
```

Equivalente na linha de comando: `ssh -J admin@jump.exemplo.com deploy@10.0.0.5`.

## 🔹 Erros comuns

- 🔐 **Permission denied (publickey)** — chave errada, `authorized_keys` ausente ou permissões `~/.ssh` incorretas no servidor.
- 🔐 **Host key verification failed** — servidor mudou (reinstalação, IP reutilizado); confira com o admin antes de `ssh-keygen -R`.
- 🔐 **Connection refused / timed out** — firewall, SSH desligado, host/porta errados.
- 🔐 **Comando funciona na mão, falha no script** — falta `BatchMode=yes`, senha interativa, ou `PATH` diferente em sessão não login (`ssh host cmd` vs login shell).
- 🔐 **scp: destino is not a directory** — caminho remoto inválido ou sem barra final em diretórios ambíguos.

## 📝 Resumo

1. 🔐 SSH = shell ou comando remoto sobre canal criptografado (PTY no destino).
2. 🔑 Prefira **chave pública** + `~/.ssh/config` para hosts recorrentes.
3. 📜 Em scripts: quoting explícito, `BatchMode=yes`, teste **exit code**, não assuma mesmo ambiente local/remoto.
4. 🪟 Sessões longas: **tmux** no servidor; desconexão → **SIGHUP** ([trap](../trap/trap.md)).

## ➡️ Próximo passo

[Integradora de logs](../pratica/integradora/) — projeto prático de tratamento de logs (pode estender com cópia ou análise remota via SSH).

🔙 [Voltar ao índice](../README.md)
