# Usa uma imagem base oficial do Python estável.
# python:3.10-slim-buster é uma boa escolha por ser leve e compatível.
FROM python:3.10-slim-buster

# Define o diretório de trabalho dentro da imagem Docker.
WORKDIR /app

# Copia o arquivo requirements.txt e instala as dependências.
# O --no-cache-dir é para otimizar o tamanho da imagem.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o restante do código da sua aplicação para o diretório de trabalho.
COPY . .

# Expõe a porta em que a aplicação FastAPI vai rodar.
EXPOSE 8000

# Comando para executar a aplicação Uvicorn quando o contêiner iniciar.
# Removido --reload, que é para desenvolvimento.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
#