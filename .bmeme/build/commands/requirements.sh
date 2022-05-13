#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Check system requirements"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo '============ Checking system requirements ...'
  docker --version
  docker-compose --version
  echo '============ Requirements are OK!'
  exit 0
fi
