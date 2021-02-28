terraform {
  backend "azurerm" {
    storage_account_name = "${TF_VAR_sta_name}"
    container_name       = "terraformstate"
    key                  = "${KEY}"
  }
}

