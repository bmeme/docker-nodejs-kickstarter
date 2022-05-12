#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/../common/lib.sh"

echo "Please specify the vendor for your new project."
echo "Typically this is your organization name, or the organization the projects belongs to."
echo -n -e "${CY}Vendor:${CN} "
read VENDOR

echo ""
echo "Please specify the name for your new project."
echo -n -e "${CY}Project name:${CN} "
read PROJECT

echo ""
echo -e "Configuring ${CG}env${CN} file..."
sed "s/__PROJECT__/${PROJECT}/g;s/__VENDOR__/${VENDOR}/g" "${BASE_PRJ_DIR}/.env.dist" > "${BASE_PRJ_DIR}/.env"

echo ""
echo -e "Removing ${CG}.env.dist${CN} file..."
rm -f "${BASE_PRJ_DIR}/.env.dist"
