data "azurerm_subnet" "sub-data" {
  name                 = "subnet"
  virtual_network_name = "network"
  resource_group_name  ="rg-assignment"
}