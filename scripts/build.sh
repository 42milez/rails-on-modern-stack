#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${0}")" || exit; pwd)

# shellcheck source=./utils.sh
. "${SCRIPT_DIR}/utils.sh"

#  Install front-end packages
# --------------------------------------------------

yarn_install

#  Install gems
# --------------------------------------------------

bundle_install

#  Create docker images
# --------------------------------------------------

docker_compose_build
