#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${0}")" || exit; pwd)
WORK_DIR=$(pwd)

# shellcheck source=./utils.sh
. "${SCRIPT_DIR}/utils.sh"

if [[ -e "${WORK_DIR}/.initialized" ]]; then
  echo_notice "already initialized"
  exit 0
fi

#  Install front-end packages
# --------------------------------------------------

yarn_install

#  Install gems
# --------------------------------------------------

bundle_install

#  Initialize project
# --------------------------------------------------


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
