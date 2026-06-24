# Laboratório SSH local

Exercícios **17.F1–17.D2** do [PLANO-EXERCICIOS.md](PLANO-EXERCICIOS.md) não exigem servidor na nuvem. Opções para praticar na sua máquina.

## Opção 1: `ssh localhost` (mais simples)

1. Instale o servidor SSH se ainda não tiver:
   - Ubuntu/Debian: `sudo apt install openssh-server`
   - macOS: Ativar “Acesso remoto” nas preferências (ou usar só opção 2)
2. Gere chave se não tiver: `ssh-keygen -t ed25519`
3. Copie para você mesmo: `ssh-copy-id "$(whoami)@localhost"`
4. Teste: `ssh localhost 'hostname'`

Gabarito: `bash pratica/solucoes/17-check-remoto.sh localhost /tmp`

## Opção 2: Container Docker (isolado)

```bash
docker run -d --name ssh-lab -p 2222:22 \
  linuxserver/openssh-server:latest
# Consulte a documentação da imagem para usuário/senha ou chave
ssh -p 2222 usuario@localhost
```

Ajuste `~/.ssh/config`:

```sshconfig
Host ssh-lab
    HostName localhost
    Port 2222
    User USUARIO_DA_IMAGEM
```

## Opção 3: Segunda VM ou WSL ↔ Windows

- WSL2: `ssh` do Windows Terminal para o IP do WSL (`hostname -I` dentro do WSL).
- VirtualBox/UTM: instale Linux guest e conecte pelo IP da rede virtual.

## Opção 4: Sem SSH instalado

Faça os exercícios **16** (`trap`) e a **integradora** normalmente; volte ao **17** quando tiver um host. Documente no checklist “SSH pendente — ambiente”.

## `scp` local

```bash
scp pratica/integradora/script.sh localhost:/tmp/integradora-script.sh
ssh localhost 'md5sum /tmp/integradora-script.sh'
md5sum pratica/integradora/script.sh
```

## Problemas comuns neste lab

| Sintoma | O que verificar |
|---------|-----------------|
| `Connection refused` | `sshd` rodando? `systemctl status ssh` |
| `Permission denied` | Chave em `authorized_keys`, permissões `~/.ssh` (700/600) |
| Host key prompt toda vez | Entrada em `known_hosts` ou `StrictHostKeyChecking accept-new` no lab |

🔙 [PLANO-EXERCICIOS.md](PLANO-EXERCICIOS.md) · [ssh/ssh.md](../ssh/ssh.md)
