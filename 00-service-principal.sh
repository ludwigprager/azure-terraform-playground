#!/usr/bin/env bash

set -eu

THIS=$0

usage() {
cat << EOF
Usage: ${THIS} "<subscription name>"
example:

${THIS} g1-dev

EOF
}


if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

subscription_name=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/set-env.sh

subscription=$(az account list | jq -r --arg subscription_name "$subscription_name" '.[] | select(.name==$subscription_name)')

subscription_id=$(echo $subscription | jq -r .id)
tenant_id=$(echo $subscription | jq -r .tenantId)

service_principal=$(az ad sp create-for-rbac \
  --role="Contributor" \
  --scope="/subscriptions/${subscription_id}" \
  --name="${display_name}")

application_id=$(az ad app list --display-name ${display_name} --query [].appId -o tsv)
password=$(echo $service_principal | jq -r .password )

export client_id=$application_id
export subscription_id=$subscription_id
export client_secret=$password
export tenant_id=$tenant_id

envsubst < $DIR/terraform.tfvars.tpl > $DIR/terraform.tfvars

echo
echo
echo
echo
echo
echo waiting for 60 seconds for the service principal to get available for Azure
echo in case you find an error message similar to: Error building account: Error getting authenticated object ID: Error listing Service Principals:
echo simply retrigger with:
echo
echo $DIR/10-deploy.sh
echo

sleep 60

$DIR/10-deploy.sh
