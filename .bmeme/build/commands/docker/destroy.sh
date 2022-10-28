#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Clean docker environment"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo -e "============ ${CB}Cleaning${CN} docker environment ..."
  docker-compose down -v
fi
