resource "azurerm_subnet" "sub" {
  name                 = "subnet"
  resource_group_name  ="rg-assignment"
  virtual_network_name ="network"
  address_prefixes     = ["10.0.2.0/24"]
}


