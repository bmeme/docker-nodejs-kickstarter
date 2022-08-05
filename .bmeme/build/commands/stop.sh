#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Stop docker environment"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo ""
  echo -e "Stopping your ${CG}docker environment${CN} ..."
  echo ""
  echo "${LOGPREFIX} CMD docker-compose stop" >> ${LOGFILE}
  docker-compose stop 2>&1 >> ${LOGFILE}
fi
