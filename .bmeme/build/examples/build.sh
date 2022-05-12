#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Build application"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo '============ Building application ...'
  pushd "${APP_DIR_PATH}" > /dev/null
  echo "${LOGPREFIX} CMD ${C_BIN} yarn build" >> ${LOGFILE}
  ${C_BIN} yarn build
  popd > /dev/null
fi
