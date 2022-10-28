#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Build application"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo '============ Building application ...'
  pushd -- ${APP_DIR} > /dev/null
  echo "${LOGPREFIX} CMD ${C_BIN} npm run build" >> ${LOGFILE}
  ${C_BIN} npm run build
  popd > /dev/null
fi
