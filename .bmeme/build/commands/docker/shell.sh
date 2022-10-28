#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Run a shell inside the docker container"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo -e "============ ${CB}Running${CN} a shell inside the docker container ..."
  echo "${LOGPREFIX} CMD ${C_BIN} bash" >> ${LOGFILE}
  ${C_BIN} bash
fi
