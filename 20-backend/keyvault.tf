
resource "azurerm_key_vault" "example" {
  name                        = var.keyvault_name
  location                    = azurerm_resource_group.rg-sta-backend.location
  resource_group_name         = azurerm_resource_group.rg-sta-backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
# soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id                   = var.tenant_id
    object_id = var.signed_in_user_object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get", "Set",
    ]

    storage_permissions = [
      "Get",
    ]
  }

}
