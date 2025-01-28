# Integração de Script Shell e Python com Ambiente Docker

---

## Visão Geral do Projeto
Este projeto demonstra a integração de um script Shell e uma aplicação Python para gerenciar processos utilizando arquivos de PID. Ele inclui:

- **Script Shell (`cromai.sh`)**:
  - Monitora a existência de um arquivo de PID.
  - Verifica se o processo associado ao PID está ativo.
  - Cria ou reinicia o processo Python conforme necessário.
  - Registra erros em um arquivo de log caso o arquivo de PID esteja ausente.

- **Script Python (`cromai.py`)**:
  - Simula um processo imprimindo mensagens.
  - Escreve seu próprio PID em um arquivo para rastreamento.

- **Dockerfile**:
  - Configura o ambiente necessário para executar a aplicação.

---

## Funcionalidades
- Gerenciamento automático de processos usando arquivos de PID.
- Mecanismo de registro de erros em log.
- Configuração personalizável do tempo de espera e do número de interações no script Python.
- Ambiente dockerizado para facilitar a configuração e execução.

---

## Estrutura dos Arquivos
- `cromai.sh`: Script Shell para gerenciar o processo Python.
- `cromai.py`: Script Python que simula um processo.
- `Dockerfile`: Arquivo para configuração do ambiente Docker.
- `cromai.log`: Arquivo de log para erros (gerado automaticamente).

---
