#!/usr/bin/env bash

docker-compose run app rails db:create
docker-compose run app rails db:migrate
