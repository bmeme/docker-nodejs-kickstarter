#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Run application"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo '============ Running application ...'
  pushd "${APP_DIR_PATH}" > /dev/null
  echo "${LOGPREFIX} CMD ${C_BIN} yarn start" >> ${LOGFILE}
  ${C_BIN} yarn start
  popd > /dev/null
fi
