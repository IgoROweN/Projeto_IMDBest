## 🎬 API RESTful - Filmes & Premiações + Previsão de Prêmios

Este projeto reúne uma API backend em **Node.js** (Express + MongoDB) e uma API de Machine Learning em **Python** (FastAPI) para previsão de indicações e vitórias no Oscar e Globo de Ouro. O sistema serve dados sobre filmes, usuários, premiações e também permite consultar as chances de um filme ser indicado ou vencer nas principais premiações.

---

### ✅ Funcionalidades

- Cadastro e login de usuários (com JWT)
- Listagem de filmes e premiações
- Envio de novos filmes para análise
- Previsão de chances de indicação/vitória para Oscar e Globo de Ouro (API Python)
- API protegida por autenticação

---

### 🚀 Instalação das APIs

#### Backend Node.js

```bash
# Clone o repositório
cd backend
npm install

# Crie um arquivo .env com as seguintes variáveis:
```

`.env`
```
PORT=5000
MONGO_URI=mongodb://localhost:27017/filmes-db
JWT_SECRET=sua-chave-secreta
```

```bash
# Inicie o servidor
npm start
```

#### API de Machine Learning (Python)

Pré-requisitos: Python 3.8+ (recomendado), FastAPI, Uvicorn, scikit-learn, xgboost, pandas, joblib

```bash
# Instale as dependências
python -m pip install fastapi uvicorn scikit-learn xgboost pandas joblib

# Rode a API (ajuste o caminho se necessário)
uvicorn Scripts.api_modelo:app --reload
```

Acesse a documentação interativa da API Python em: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

---

### 📡 Rotas da API Node.js

#### 🔐 Autenticação

- `POST /api/auth/registrar` — Cadastro de usuário
- `POST /api/auth/login` — Login de usuário

#### 🎞️ Filmes

- `GET /api/filmes` — Lista todos os filmes
- `POST /api/filmes` — Envia novo filme para análise (JWT obrigatório)

#### 🏆 Premiações

- `GET /api/premiacoes` — Lista todas as premiações cadastradas

---

### 🤖 Rotas da API Python (Machine Learning)

- `POST /predict`  
  Consulta as chances de um filme específico ser indicado ou vencer em uma ou mais categorias.  
  **Body:**
  ```json
  {
    "title": "Nome do Filme",
    "year": 2025,
    "categorias": ["oscar_nominated", "oscar_winner"]
  }
  ```
  **Resposta:**
  ```json
  {
    "oscar_nominated": 0.12,
    "oscar_winner": 0.01
  }
  ```

- `GET /top10?categoria=oscar_nominated`  
  Retorna os 10 filmes com maior chance naquela categoria.

---

### 📱 App Mobile

O aplicativo mobile será desenvolvido em **Flutter**, com foco em:

- Interface para login e cadastro de usuário
- Tela de listagem dos filmes e seus dados (IMDB, duração, etc.)
- Visualização das premiações e últimos vencedores
- Consulta das chances de indicação/vitória de um filme (botão visível apenas para filmes ainda não premiados)

---

### 📦 Estrutura do Projeto

```
raiz-do-projeto/
├── backend/          # API Node.js (Express + MongoDB)
├── Scripts/          # Scripts Python (treinamento e API FastAPI)
├── frontend/         # App .NET MAUI (ou Flutter, se aplicável)
├── README.md         # Este arquivo
```

---

### 📬 Contato

Dúvidas ou sugestões? Entre em contato com a equipe de desenvolvimento.

---

> Projeto acadêmico com fins de aprendizado. Utiliza dados públicos do IMDB, Oscar e Globo de Ouro.

