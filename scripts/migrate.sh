#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${0}")" || exit; pwd)

# shellcheck source=./utils.sh
. "${SCRIPT_DIR}/utils.sh"

docker_compose_exec "app rails db:create"

docker_compose_exec "app rails db:migrate"
