output "storageAccountName" {
  value = azurerm_storage_account.sta-atp-001.name
}

output "storageAccountID" {
  value = azurerm_storage_account.sta-atp-001.id
}

output "storageAccountNameAccessKey" {
  value = azurerm_storage_account.sta-atp-001.primary_access_key
}

output "storageAccountContainer" {
  value = azurerm_storage_container.atp-container-001.name
}
