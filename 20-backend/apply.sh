#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ../set-env.sh


terraform init

export TF_VAR_signed_in_user_object_id=$( az ad signed-in-user show  | jq -r .objectId )

terraform apply \
  -var-file ../terraform.tfvars \
  -auto-approve

export ARM_ACCESS_KEY=$(terraform output -json | jq -r .storageAccountNameAccessKey.value)


echo storing the access key in azure vault
az keyvault secret set \
  --vault-name "${TF_VAR_keyvault_name}" \
  --name "${TF_VAR_access_key_secret_name}" \
  --value "${ARM_ACCESS_KEY}"
