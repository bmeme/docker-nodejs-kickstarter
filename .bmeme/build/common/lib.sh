#!/usr/bin/env bash

set -e

CN="\\033[0m"
CR="\\033[91m"
CG="\\033[92m"
CY="\\033[93m"
CB="\\033[94m"
CT="\\033[37m"
TB="\\033[1m"

LIB_SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
BASE_PRJ_DIR=$(realpath "${LIB_SCRIPT_DIR}/../../..")
if test -f "${BASE_PRJ_DIR}/.env"; then
    source "${BASE_PRJ_DIR}/.env"
fi
APP_DIR="${BASE_PRJ_DIR}/app"

LOCAL_PATH="${BASE_PRJ_DIR}/.bmeme/bin"
C_BIN="${BASE_PRJ_DIR}/.bmeme/bin/c"
LOGDIR="${BASE_PRJ_DIR}/.bmeme/log"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
LOGFILE="${LOGDIR}/configure.log"
LOGPREFIX=">>>> "

log_begin() {
    echo "" >>${LOGFILE}
    echo "${LOGPREFIX} SCRIPT EXECUTED" >>${LOGFILE}
    echo "${LOGPREFIX} Bin: ${0}" >>${LOGFILE}
    echo "${LOGPREFIX} Params: ${@}" >>${LOGFILE}
    echo "${LOGPREFIX} Time: $(date +'%Y-%m-%d %H:%M:%S')" >>${LOGFILE}
    echo "" >>${LOGFILE}
}

log_end() {
    echo "" >>${LOGFILE}
    echo "${LOGPREFIX} SCRIPT TERMINATED" >>${LOGFILE}
    echo "${LOGPREFIX} Time: $(date +'%Y-%m-%d %H:%M:%S')" >>${LOGFILE}
    echo "" >>${LOGFILE}
}

show_cmd_error() {
    echo -e "${TB}${CR}ERROR${CN}"
    echo ""
    echo -e "See ${CB}logfile${CN} for details: "
    echo -e "\t${CY}tail -f ${LOGFILE}${CN}"
    echo ""
    exit 1
}
