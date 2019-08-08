#!/usr/bin/env bash

source ./utils.sh

WORK_DIR=$(pwd)

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

#  Initialize project
# --------------------------------------------------

if [[ -e "${WORK_DIR}/.initialized" ]]; then
  echo "error: already initialized"
  exit 1
else
  cmd="bundle exec rails new . --database=postgresql
                               --skip
                               --skip-bundle
                               --skip-coffee
                               --skip-gemfile
                               --skip-git
                               --skip-javascript
                               --skip-puma
                               --skip-sprockets"
  exec_command "${cmd}"
  date > .initialized
  rm -rf bin
fi
