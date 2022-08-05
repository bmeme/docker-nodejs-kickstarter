#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Check system requirements"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo ""
  echo -e "Checking ${CG}system requirements${CN} ..."
  echo ""
  echo "${LOGPREFIX} CMD docker --version" >> ${LOGFILE}
  docker --version 2>&1 >> ${LOGFILE}
  echo "${LOGPREFIX} CMD docker-compose --version" >> ${LOGFILE}
  docker-compose --version 2>&1 >> ${LOGFILE}
fi
