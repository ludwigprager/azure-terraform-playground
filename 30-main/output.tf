output "vnetResourceGroup" {
    value = azurerm_resource_group.rg-infra-atp-001.name
}

output "vnetName" {
    value = azurerm_virtual_network.vnet-atp-001.name
}

output "vnetID" {
    value = azurerm_virtual_network.vnet-atp-001.id
}

output "vnetAddressSpace" {
    value = azurerm_virtual_network.vnet-atp-001.address_space
}

output "vnetSubnetName1" {
    value = azurerm_subnet.snet-atp-001-aks-pool01.name
}

output "vnetSubnetPrefix1" {
    value = azurerm_subnet.snet-atp-001-aks-pool01.address_prefix
}

output "vnetSubnetName2" {
    value = azurerm_subnet.snet-atp-001-aks-svc01.name
}

output "vnetSubnetPrefix2" {
    value = azurerm_subnet.snet-atp-001-aks-svc01.address_prefix
}

output "vnetSubnetName3" {
    value = azurerm_subnet.snet-atp-001-aks-fw01.name
}

output "vnetSubnetPrefix3" {
    value = azurerm_subnet.snet-atp-001-aks-fw01.address_prefix
}

output "vnetSubnetName4" {
    value = azurerm_subnet.snet-atp-001-aks-waf01.name
}

output "vnetSubnetPrefix4" {
    value = azurerm_subnet.snet-atp-001-aks-waf01.address_prefix
}