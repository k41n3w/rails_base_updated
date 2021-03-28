# Projeto Rails Base Atualizado
[![Rails Tests](https://github.com/k41n3w/rails_base_updated/actions/workflows/ruby.yml/badge.svg?branch=main)](https://github.com/k41n3w/rails_base_updated/actions/workflows/ruby.yml) ![Rubocop](https://github.com/k41n3w/rails_base_updated/workflows/Rubocop/badge.svg) ![Brakeman Scan](https://github.com/k41n3w/rails_base_updated/workflows/Brakeman%20Scan/badge.svg) ![Codacy Security Scan](https://github.com/k41n3w/rails_base_updated/workflows/Codacy%20Security%20Scan/badge.svg)

Esse é um repositório para startar projetos rails atualizados e com um padrão básico.
Possui uma model de User com exemplos dos verbos http e login baseado em chave jwt.

--> [Link da aplicação no Heroku](https://rails-base-updated.herokuapp.com/) <--

--> [Link da documentação no Heroku](http://rails-base-updated.herokuapp.com/api-docs/index.html) <--

Configurações:
- Github Actions Workflow do Ruby para rodar testes a partir da **gem Rspec**;
- Github Actions para controle de guia de estilos do Ruby com a **gem Rubocop**;
- Github Actions para controle de vunerabilidades com o a **gem Brakeman**.
- Github Actions para controle segurança com o **Codacy Security**;
- Controle de exceções com a **gem Rollbar**;
- Documentação com a **gem Rswag**.

### Depois de baixar o projeto
Para construir o projeto locamente:

```bash
$ docker-compose build .
```

Para subir a aplicação criada com o comando anterior:
```bash
$ docker-compose up --build
```

Para configurar o banco, dentro do container rode:
```bash
$ rails db:create db:migrate
```

Para rodar o Rubocop localmente, dentro do container rode:
```bash
$ rubocop
```

Para rodar o Brakeman localmente, dentro do container rode:
```bash
$ brakeman
```

Para rodar o Rspec localmente, dentro do container rode:
```bash
$ rspec
```

Para rodar o Rswag localmente, dentro do container rode:
```bash
$ rails rswag
```

Se tudo estiver correto, como acho que deve estar, ao subir o projeto você conseguerá ver a página de configuração do rails no endereço: http://0.0.0.0/
