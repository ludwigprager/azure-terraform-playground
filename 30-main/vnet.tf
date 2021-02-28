# Create Azure Resource Group
resource "azurerm_resource_group" "rg-infra-atp-001" {
  name                = var.infra_rg_name
  location            = var.infra_rg_location
}

# Create Azure Virtual Network
resource "azurerm_virtual_network" "vnet-atp-001" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg-infra-atp-001.name
  location            = azurerm_resource_group.rg-infra-atp-001.location
  address_space       = [var.address_space]
}

# Create AKS Node pool subnet
resource "azurerm_subnet" "snet-atp-001-aks-pool01" {
  name                 = var.snet_name_01
  virtual_network_name = azurerm_virtual_network.vnet-atp-001.name
  resource_group_name  = azurerm_resource_group.rg-infra-atp-001.name
  address_prefixes     = [var.address_prefix_01]
}

# Create AKS services subnet
resource "azurerm_subnet" "snet-atp-001-aks-svc01" {
  name                 = var.snet_name_02
  virtual_network_name = azurerm_virtual_network.vnet-atp-001.name
  resource_group_name  = azurerm_resource_group.rg-infra-atp-001.name
  address_prefixes     = [var.address_prefix_02]
}

# Create Azure Firewall subnet
resource "azurerm_subnet" "snet-atp-001-aks-fw01" {
  name                 = var.snet_name_03
  virtual_network_name = azurerm_virtual_network.vnet-atp-001.name
  resource_group_name  = azurerm_resource_group.rg-infra-atp-001.name
  address_prefixes     = [var.address_prefix_03]
}

# Create Azure WAF subnet
resource "azurerm_subnet" "snet-atp-001-aks-waf01" {
  name                 = var.snet_name_04
  virtual_network_name = azurerm_virtual_network.vnet-atp-001.name
  resource_group_name  = azurerm_resource_group.rg-infra-atp-001.name
  address_prefixes     = [var.address_prefix_04]
}
