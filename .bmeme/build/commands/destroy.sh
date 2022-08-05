#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Clean docker environment"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo ""
  echo -e "Cleaning ${CG}docker environment${CN} ..."
  echo ""
  echo "${LOGPREFIX} CMD docker-compose down -v" >> ${LOGFILE}
  docker-compose down -v 2>&1 >> ${LOGFILE}
fi
