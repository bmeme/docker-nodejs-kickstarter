#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Show docker container logs"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo -e "============ ${CB}Showing${CN} docker container logs ..."
  docker-compose logs -f
fi
