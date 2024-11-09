# Go API - Projeto de API RESTful com Autenticação JWT

Este projeto é uma API desenvolvida em Go com uma arquitetura modular, projetada para fornecer uma interface RESTful para operações de CRUD e autenticação baseada em JSON Web Token (JWT). A aplicação é estruturada para facilitar a expansão e a manutenção, além de ser otimizada para execução em containers Docker.

## Tabela de Conteúdos

- [Descrição](#descrição)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Funcionalidades](#funcionalidades)
- [Autenticação JWT](#autenticação-jwt)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Execução](#execução)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Documentação da API com Swagger](#documentação-da-api-com-swagger)
- [Deploy com Docker](#deploy-com-docker)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Descrição

A Go API é uma aplicação backend que fornece endpoints RESTful para operações de CRUD em uma entidade específica (ex.: `Resource`). Além das operações de CRUD, a API implementa autenticação JWT para proteger rotas e permitir apenas o acesso de usuários autenticados.

## Tecnologias Utilizadas

- **Go**: Linguagem principal do projeto, escolhida pela sua performance e facilidade de manutenção.
- **JWT (JSON Web Token)**: Autenticação segura e padronizada para proteger as rotas da API.
- **SQLite**: Banco de dados leve para persistência local. Pode ser substituído facilmente por outro banco de dados.
- **Docker**: Utilizado para criar um ambiente isolado para a aplicação, facilitando o deploy e a consistência de ambientes.
- **Docker Compose**: Gerencia a orquestração de containers, simplificando a configuração da aplicação e seus serviços dependentes.
- **GORM**: ORM (Object-Relational Mapping) para manipulação de dados em Go.
- **godotenv**: Carrega as variáveis de ambiente de um arquivo `.env`, facilitando a configuração e a manutenção.
- **Swagger**: Utilizado para a documentação interativa da API, permitindo visualizar e testar endpoints de forma intuitiva.

## Funcionalidades

- Criação de registros no banco de dados (Create)
- Recuperação de registros específicos ou de todos os registros (Read)
- Atualização de registros (Update)
- Remoção de registros (Delete)
- Autenticação baseada em JWT para rotas protegidas
- Documentação interativa da API com Swagger
- Estrutura modular para fácil expansão e adaptação

## Autenticação JWT

A API utiliza o JWT para autenticação e autorização. O fluxo de autenticação envolve os seguintes passos:

1. **Login**: O usuário envia suas credenciais para o endpoint de login.
2. **Geração do Token**: Se as credenciais forem válidas, um token JWT é gerado e enviado ao usuário.
3. **Acesso a Rotas Protegidas**: O usuário deve incluir o token no header `Authorization` (ex.: `Authorization: Bearer <token>`) para acessar as rotas protegidas.

O token JWT é assinado com uma chave secreta, garantindo que ele não seja alterado.

### Endpoints

#### Produtos

| Método | Endpoint         | Descrição                       |
| ------ | ---------------- | ------------------------------- |
| GET    | `/products`      | Lista os produtos               |
| POST   | `/products`      | Cria um novo produto            |
| GET    | `/products/{id}` | Obtém os detalhes de um produto |
| PUT    | `/products/{id}` | Atualiza os dados de um produto |
| DELETE | `/products/{id}` | Deleta um produto               |

#### Usuários

| Método | Endpoint                | Descrição                        |
| ------ | ----------------------- | -------------------------------- |
| POST   | `/users`                | Cria um novo usuário             |
| POST   | `/users/generate_token` | Gera um token JWT para o usuário |

> Note: Para acessar rotas protegidas, o token JWT deve ser incluído no cabeçalho `Authorization`.

## Pré-requisitos

- **Go** versão 1.18 ou superior
- **Docker** e **Docker Compose** (opcional, mas recomendado para containerização)
- **SQLite3** (ou outro banco de dados, caso queira configurar um diferente)

## Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/poring86/go-api.git
   cd go-api
   ```

2. No diretório do projeto, execute o seguinte comando para subir os containers:

   ```bash
   docker-compose up -d
   ```

   Esse comando irá iniciar a API e o banco de dados em containers Docker. O parâmetro -d faz com que os containers rodem em segundo plano.

3. Acesse a aplicação:

   Após os containers estarem em execução, a API estará disponível em http://localhost:8000.

   Acesse a documentação via Swagger:

   A documentação interativa da API estará disponível em:

   ```bash
   http://localhost:8000/docs/index.html
   ```
