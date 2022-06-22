technical-overview.md
Esta sección proporciona una guía de inicio rápido para desplegar tu propio analizador de ADN.
### Prerequisites

#### Local

- [Ruby](https://www.ruby-lang.org/en/): Se recomendia usar
  [rbenv](https://github.com/rbenv/rbenv) para instalar la version de ruby adecuada.
- [PostgreSQL](https://www.postgresql.org/) version 11 o más reciente.
- [Sidekiq](https://github.com/mperham/sidekiq):
  [instrucciones](https://github.com/mperham/sidekiq#getting-started).
- [Redis](https://redis.io/) version 4 o más reciente..

#### Containers
## 🔑 Key App tech/services

- [Ruby](https://www.ruby-lang.org/en/): Se recomendia usar
  [rbenv](https://github.com/rbenv/rbenv) para instalar la version de ruby adecuada.
- [PostgreSQL](https://www.postgresql.org/) version 11 o más reciente.
- [Sidekiq](https://github.com/mperham/sidekiq):
  [instrucciones](https://github.com/mperham/sidekiq#getting-started).
- [Redis](https://redis.io/) version 4 o más reciente..

- [_Puma_](https://github.com/puma/puma) as the web server
- [_PostgreSQL_](https://www.postgresql.org/) as the primary database and for Full Text Search
- [_Redis_](https://redis.io/) to store cached data
- [_Heroku_](https://www.heroku.com) for hosting
- [_Sidekiq_](https://github.com/mperham/sidekiq) and [_Active Job_](https://guides.rubyonrails.org/active_job_basics.html) for background workers
- [Git](https://git-scm.com/) for version control
- [GitHub](https://github.com/) for hosting the source code and issue tracking
- [_Docsify_](https://docsify.js.org/) for beautiful and SEO-friendly documentation
