#!/usr/bin/env bash

function echo_fail() {
  echo -e "\033[0;31m[FAILED] ${1}\033[0;39m"
}

function echo_notice() {
  echo -e "\033[0;34m[NOTICE] ${1}\033[0;39m"
}

function bundle_install() {
  if [[ $(type bundle >/dev/null 2>&1) ]]; then
    echo_fail "bundler not found"
    exit 1
  else
    cmd="bundle install -j4 --path=vendor/bundle --binstubs=vendor/bin"
    exec_command "${cmd}"
  fi
}

function docker_compose_build() {
  if [[ $(type docker-compose >/dev/null 2>&1) ]]; then
    echo_fail "docker-compose not found"
    exit 1
  else
    cmd="docker-compose build --no-cache"
    exec_command "${cmd}"
  fi
}

function docker_compose_exec() {
  if [[ $(type docker-compose >/dev/null 2>&1) ]]; then
    echo_fail "docker-compose not found"
    exit 1
  else
    cmd="docker-compose exec ${1}"
    exec_command "${cmd}"
  fi
}

function exec_command() {
  if ! ${1}; then
    exit 1
  fi
}

function yarn_install() {
  if [[ $(type yarn >/dev/null 2>&1) ]]; then
    echo_fail "yarn not found"
    exit 1
  else
    cmd="yarn install"
    exec_command "${cmd}"
  fi
}
