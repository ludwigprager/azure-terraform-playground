#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ../set-env.sh

export TF_VAR_signed_in_user_object_id=$( az ad signed-in-user show  | jq -r .objectId )

terraform destroy \
  -var-file ../terraform.tfvars \
  -auto-approve
