#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../../common/lib.sh"

if [[ "$1" == "descr" ]]; then
  echo -n "Create and start docker environment"
  exit 0
fi

if [[ "$1" == "run" ]]; then
  echo -e "============ ${CB}Creating${CN} docker environment ..."
  echo "${LOGPREFIX} CMD docker-compose build --pull --build-arg FIX_UID=\"\$(id -u)\" --build-arg FIX_GID=\"\$(id -g)\"" >> ${LOGFILE}
	docker-compose build --pull --build-arg FIX_UID="$(id -u)" --build-arg FIX_GID="$(id -g)"
  echo ""
	echo -e "============ ${CB}Starting${CN} docker environment ..."
  echo "${LOGPREFIX} CMD docker-compose up -d" >> ${LOGFILE}
  docker-compose up -d
fi
