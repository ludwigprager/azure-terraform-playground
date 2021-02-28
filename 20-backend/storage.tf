
resource "azurerm_resource_group" "rg-sta-backend" {
  name                            = var.sta_rg_name
  location                        = var.sta_rg_location
}

resource "azurerm_storage_account" "sta-atp-001" {
  name                            = var.sta_name
  resource_group_name             = azurerm_resource_group.rg-sta-backend.name
  location                        = azurerm_resource_group.rg-sta-backend.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  enable_https_traffic_only       = true
}

# Container inside Storage Account
resource "azurerm_storage_container" "atp-container-001" {
  name                            = "terraformstate"
  storage_account_name            = azurerm_storage_account.sta-atp-001.name
  container_access_type           = "private"
}
