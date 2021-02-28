#!/usr/bin/env bash

# display-name of the auto-generated app - mandatory but pretty irrelevant
display_name=sp-atp

# name of keyvault - must be globally unique
export TF_VAR_keyvault_name="atp-g1-dev-keyvault-002"

# name of storage account - must be globally unique
export TF_VAR_sta_name="staatp202102281651"

export TF_VAR_access_key_secret_name="storage-access-key"
export TF_VAR_sta_rg_location="West Europe"

