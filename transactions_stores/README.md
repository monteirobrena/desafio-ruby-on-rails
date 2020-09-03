# Transactions Store

## Descrição

Este projeto permite o upload de um arquivo de texto (.txt) contendo as informações de transações bancárias.

Essas informações são salvas no banco de dados e disponibilizadas através de um endpoint (`v1/financial_transactions?store_name=[:store_name]`) na API.

## Docker

Para rodar esse projeto com Docker execute os comandos:

```
docker-compose build
docker-compose up
docker-compose run api rake db:create RAILS_ENV=development
docker-compose run api rake db:migrate RAILS_ENV=development
docker-compose run api rake db:seed RAILS_ENV=development
```

No arquivo `config/database.yml` altere o host para `db`:

```
development:
  host: db
```

## Instalação

Para executar o projeto é preciso possuir:

- Ruby versão `2.6.3`
- Rails versão `6.0.3.2`

Para instalar as dependências, acesse a pasta do projeto (`transactions_stores`) e execute o comando:

```
bundle install
```

Para instalar as dependências de frontend é preciso ter o [Yarn](https://classic.yarnpkg.com/en/docs/install/) instalado.

Com o Yarn instalado execute o comando:

```
yarn install
````

## Banco de dados

Execute os comandos para criar o banco e as tabelas:

```
rake db:create
rake db:migrate
```

Para criar os tipos de transações execute o comando: 

```
rake db:seed
```

No arquivo `config/database.yml` altere o host para `localhost`:

```
development:
  host: localhost
```

## Execução

Para iniciar o projeto execute o comando:

```
rails s
```

## Acesso

Acesse a página de upload através do browser no endereço:

http://127.0.0.1:3000/financial_transactions/new

Acesse a API pelo endereço:

http://127.0.0.1:3000/v1/financial_transactions

A documentação da API encontra-se na pasta `doc/README.md`.

## Testes

Para rodar os testes execute o comando:

```
rspec spec
```

Para visualizar a cobertura dos testes abra o arquivo `coverage/index.html` no browser. É possível abri-lo com o comando:

```
open coverage/index.html
```

