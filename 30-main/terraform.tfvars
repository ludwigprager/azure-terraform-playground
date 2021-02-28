# Azure Virtual Network Variables
infra_rg_name                   = "rg-infra-atp-001"
infra_rg_location               = "West Europe"

vnet_name                       = "vnet-atp-001"
address_space                   = "11.0.0.0/16"
snet_name_01                    = "snet-atp-001-aks-pool01"
address_prefix_01               = "11.0.1.0/24"
snet_name_02                    = "snet-atp-001-aks-svc01"
address_prefix_02               = "11.0.2.0/24"
snet_name_03                    = "AzureFirewallSubnet"
address_prefix_03               = "11.0.3.0/24"
snet_name_04                    = "snet-atp-001-aks-waf01"
address_prefix_04               = "11.0.4.0/24"
