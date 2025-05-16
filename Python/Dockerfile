# Imagem base com Python 3.11
FROM python:3.11-slim

# Definir diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto
COPY . /app

# Instalar dependências de sistema para numpy, pandas, etc.
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Instalar bibliotecas Python necessárias
RUN pip install --no-cache-dir \
    fastapi \
    uvicorn \
    pandas \
    numpy \
    pymongo \
    joblib \
    scikit-learn

# Expor a porta do FastAPI
EXPOSE 8000

# Rodar a aplicação
CMD ["uvicorn", "api_modelo:app", "--host", "0.0.0.0", "--port", "8000"]
