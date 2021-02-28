#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
source ../set-env.sh

export KEY="vnet.tfstate"
envsubst < backend.tf.tpl > backend.tf

echo reading the access key from azure vault
export ARM_ACCESS_KEY=$( \
  az keyvault secret show \
  --vault-name "${TF_VAR_keyvault_name}" \
  --name "${TF_VAR_access_key_secret_name}" \
  | jq -r .value
)

terraform init

terraform destroy -auto-approve -var-file=../terraform.tfvars

