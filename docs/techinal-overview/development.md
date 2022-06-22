# Desarrollo
Esta sección proporciona una guía de inicio rápido para desplegar tu propio analizador de ADN.
### Prerequisites

#### Local

- [Ruby](https://www.ruby-lang.org/en/): Se recomendia usar
  [rbenv](https://github.com/rbenv/rbenv) como manejador de versiones e instalar la version de ruby adecuada.
- [PostgreSQL](https://www.postgresql.org/) version 11 o más reciente.
- [Sidekiq](https://github.com/mperham/sidekiq):
  [instrucciones](https://github.com/mperham/sidekiq#getting-started).
- [Redis](https://redis.io/) version 4 o más reciente..

#### Instalar dependecias

#### Ruby
1. Instalar el manejador de versiones `rbenv` o el de su preferencia
2. Usando el manejador de veriones, instalar la version de ruby adecuada
  (i.e. con rbenv: `rbenv install $(cat .ruby-version)`)
#### Redis
En MacOS usando [Homebrew](https://brew.sh):

```shell
brew install redis
```

puedes seguir las instrucciones de post-instalación, para ejecutar redis puedes usar
`brew services` y ejecutarlo en background:

```shell
brew services start redis
```

Se puede comprobar la correcta instalacion con el siguiente comando:

```shell
redis-cli ping
```

#### Postgres

Una guia rapida para instalar los servicios la puedes encontrar en
[Postgres.app](https://postgresapp.com/). De igual forma, consultar la documentacion oficial
[PostgreSQL](https://www.postgresql.org/).

For additional configuration options, check our
[PostgreSQL setup guide](postgresql.md).
1. macOS
  - Homebrew
  - [Postgres.app](https://postgresapp.com/)
2. Linux (Ubuntu)
  - (Ubuntu 18.04)[https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04]
  - (Ubuntu 20.04)[https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04]
3. Windows(https://www.postgresql.org/download/windows/)

#### Contenedores

Para mayor facilidad algunos de los servicios necesarios para ejecutar el proyecto ya estan dockerizados.

##### Prerequesito
1. Instalar docker en tu sistema
2. Compose el contenedor
  ```shell
  docker-compose up -d
  ````
3. Comprobar ejecución
  ```shell
  docker ps --filter "name=mutant"
  ```
  al ejecutar este comando deberias tener 3 contenedores ejecutando.
