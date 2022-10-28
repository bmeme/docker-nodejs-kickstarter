#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Run application"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo '============ Run application ...'
  pushd -- ${APP_DIR} > /dev/null
  echo "${LOGPREFIX} CMD ${C_BIN} PORT=${PROJECT_PORT} npm start" >> ${LOGFILE}
  ${C_BIN} PORT=${PROJECT_PORT} npm start
  popd > /dev/null
fi
