#!/usr/bin/env bash

bundle install -j4 --path=vendor/bundle --binstubs=vendor/bin

yarn install

docker-compose build --no-cache
