resource "azurerm_subnet" "sub" {
  name                 = "subnet-prod"
  resource_group_name  ="rg-assignment-prod"
  virtual_network_name ="network-prod"
  address_prefixes     = ["192.168.1.0/24"]
}


