#!/usr/bin/env

function exec_command() {
  if ! ${1}; then
    echo "error: initialization failed"
    exit 1
  fi
}
