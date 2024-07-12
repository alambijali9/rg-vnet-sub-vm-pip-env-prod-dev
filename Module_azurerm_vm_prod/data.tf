data "azurerm_subnet" "sub-data-prod" {
  name                 = "subnet-prod"
  virtual_network_name = "network-prod"
  resource_group_name  ="rg-assignment-prod"
}