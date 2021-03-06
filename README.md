## What is this?

This repository provides an environment for developing web application with Ruby on Rails on modern software stack.


## Quick start

```shell
git checkout -b demo origin/demo
yarn run build:dev
docker-compose up -d
./script/migrate.sh
```

After the migration, the demo application is served at `localhost:8888`.

Note: The application is based on [this article](https://qiita.com/geek_shanshan/items/8f348734d95d9ece9576).


## Environment

- Nginx: 1.17.1
- PostgreSQL: 11.4
- Ruby: 2.6.3
- Ruby on Rails: 5.2.3


## Initializing project

`./script/init.sh`


## Using Docker

- Start containers: `docker-compose up -d`
- Stop containers: `docker-compose stop`


## Other scripts

- Build containers: `./script/build.sh`
- Migration: `./script/migrate.sh`

