# Projeto Rails Base Atualizado
Esse é um repositório para startar projetos rails atualizados e com um padrão básico.
Por enquanto temos configurado no Github Actions o Workflow do Ruby e controles de qualidade de código com o Rubocop.

![Ruby](https://github.com/kaioramos/rails_base_updated/workflows/Ruby/badge.svg) ![Rubocop](https://github.com/k41n3w/rails_base_updated/workflows/Rubocop/badge.svg)



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

Se tudo estiver correto, como acho que deve estar, ao subir o projeto você conseguerá ver a página de configuração do rails no endereço: http://0.0.0.0/
