# rails_base_updated
Rails base updated

![Ruby](https://github.com/kaioramos/rails_base_updated/workflows/Ruby/badge.svg)

#### Create Application
```bash
$ docker-compose run web rails new . --force --no-deps --database=postgresql
```

#### Create Application in API Mode
```bash
$ docker-compose run web rails new . --api --force --no-deps --database=postgresql
```

#### After creation
Build the project

```bash
$ docker-compose build .
```

Up the application
```bash
$ docker-compose up --build
```

Setup BD, inside de container run
```bash
$ rails db:create db:migrate
```

If is everthing fine you'll see the configuration Ruby on Rails page on http://0.0.0.0/
