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
  echo "=============================================================================================="
  echo -e " ${CB}${TB}${COMPOSE_PROJECT_NAME}${CN} - ${CB}Create and initialize application${CN} "
  echo "=============================================================================================="
  echo ""

  echo ""
  echo -e "Setting up ${CG}docker environment${CN} ..."
  echo ""
  echo "${LOGPREFIX} CMD docker-compose build --build-arg FIX_UID=$(id -u) --build-arg FIX_GID=$(id -g)" >> ${LOGFILE}
  docker-compose build --build-arg FIX_UID=$(id -u) --build-arg FIX_GID=$(id -g) 2>&1 >> ${LOGFILE}
  echo "${LOGPREFIX} CMD docker-compose up -d" >> ${LOGFILE}
  docker-compose up -d 2>&1 >> ${LOGFILE}

  echo ""
  if [[ ":$PATH:" == *":$LOCAL_PATH:"* ]]; then
    echo -e "Your ${CG}\$PATH${CN} is correctly set"
  else
    echo -e "Your ${CG}\$PATH${CN} is not configured."
    echo ""
    echo -e "Run: ${CY}eval \$(${BASE_PRJ_DIR}/bmeme env)${CN}"
    echo ""
  fi

  echo ""
  echo "=============================================================================================="
  echo -e " ${CB}${TB}${COMPOSE_PROJECT_NAME}${CN} - ${CB}Application successfully created!${CN}"
  echo "=============================================================================================="
  echo ""
fi
