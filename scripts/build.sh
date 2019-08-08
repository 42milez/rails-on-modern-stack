#!/usr/bin/env bash

source ./utils.sh

#  Install front-end packages
# --------------------------------------------------

if [[ $(type yarn >/dev/null 2>&1) ]]; then
  echo "error: yarn not found"
  exit 1
else
  cmd="yarn install"
  exec_command "${cmd}"
fi

#  Install gems
# --------------------------------------------------

if [[ $(type bundle >/dev/null 2>&1) ]]; then
  echo "error: bundler not found"
  exit 1
else
  cmd="bundle install -j4 --path=vendor/bundle --binstubs=vendor/bin"
  exec_command "${cmd}"
fi

#  Create docker images
# --------------------------------------------------

if [[ $(type docker-compose >/dev/null 2>&1) ]]; then
  echo "error: docker-compose not found"
  exit 1
else
  cmd="docker-compose build --no-cache"
  exec_command "${cmd}"
fi
