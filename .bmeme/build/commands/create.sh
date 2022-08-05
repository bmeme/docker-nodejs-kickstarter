#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Create and initialize application"
  exit 0
fi

if [[ "$1" == "run" ]]; then

  echo ""
  echo -e "Setting up ${CG}docker environment${CN} ..."
  echo ""
  echo "${LOGPREFIX} CMD docker-compose build --build-arg FIX_UID=$(id -u) --build-arg FIX_GID=$(id -g)" >> ${LOGFILE}
  docker-compose build --build-arg FIX_UID=$(id -u) --build-arg FIX_GID=$(id -g) 2>&1 >> ${LOGFILE}
  echo "${LOGPREFIX} CMD docker-compose up -d" >> ${LOGFILE}
  docker-compose up -d 2>&1 >> ${LOGFILE}
  echo ""

fi
