#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/set-env.sh

$DIR/30-main/destroy.sh || true
$DIR/20-backend/destroy.sh || true


application_id=$(az ad app list --display-name ${display_name} --query [].appId -o tsv)
echo deleting application ${application_id}
az ad app delete --id $application_id
