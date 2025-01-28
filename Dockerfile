# Escolha uma imagem base
FROM ubuntu:20.04

# Defina o autor
LABEL maintainer="gustavoandremoliveira@gmail.com"

# Atualize os pacotes e instale dependências
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Crie e use um diretório de trabalho
WORKDIR /app

# Copie arquivos locais para a imagem
COPY . .

# Instale dependências do projeto (se necessário)
RUN pip3 install -r requirements.txt



# Comando para iniciar o contêiner
CMD ["sh", "cromai.sh"]
#CMD ["tail", "-f", "/dev/null"]