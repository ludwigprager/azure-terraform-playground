#!/usr/bin/env bash

# name of keyvault - must be globally unique
# I'd suggest to use the current data & time
export TF_VAR_keyvault_name="atp-keyvault-202102281651"

# name of storage account - must be globally unique
# I'd suggest to use the current data & time
export TF_VAR_sta_name="staatp202102281651"

export TF_VAR_access_key_secret_name="storage-access-key"
export TF_VAR_sta_rg_location="West Europe"

# display-name of the auto-generated app - mandatory but pretty irrelevant
display_name=sp-atp
