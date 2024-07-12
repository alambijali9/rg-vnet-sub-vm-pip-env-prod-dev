resource "azurerm_virtual_network" "vnet-prod" {
  name                = "network-prod"
  address_space       = ["192.168.0.0/16"]
  location            = "West Europe"
  resource_group_name = "rg-assignment-prod"
}
  
