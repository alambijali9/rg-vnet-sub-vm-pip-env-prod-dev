resource "azurerm_virtual_network" "vnet" {
  name                = "network"
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  resource_group_name = "rg-assignment"
}
  
