#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Show docker environment status"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo ""
  echo -e "Checking ${CG}docker environment${CN} status ..."
  echo ""
  echo "${LOGPREFIX} CMD docker-compose ps" >> ${LOGFILE}
  docker-compose ps
fi
