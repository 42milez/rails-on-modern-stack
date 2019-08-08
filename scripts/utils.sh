#!/usr/bin/env

function echo_fail() {
  echo "\033[0;31m[FAILED] ${1}\033[0;39m"
}

function echo_notice() {
  echo "\033[0;34m[NOTICE] ${1}\033[0;39m"
}

function exec_command() {
  if ! ${1}; then
    echo_fail "command failed"
    exit 1
  fi
}
