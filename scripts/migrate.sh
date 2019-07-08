#!/usr/bin/env bash

docker-compose exec app rails db:create
docker-compose exec app rails db:migrate
