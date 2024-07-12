resource "azurerm_public_ip" "pip-prod" {
  name                = "vm1-pip-prod"
  resource_group_name = "rg-assignment-prod"
  location            = "West Europe"
  allocation_method   = "Static"

}


resource "azurerm_network_security_group" "nsg-prod" {
  name                = "nsg1-prod"
  location            ="West Europe"
  resource_group_name ="rg-assignment-prod"

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



resource "azurerm_network_interface" "nic-prod" {
  name                = "nic1-prod"
  location            = "West Europe"
  resource_group_name = "rg-assignment-prod"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sub-data-prod.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip-prod.id
    
    
  }
}

resource "azurerm_network_interface_security_group_association" "asso-prod" {
  network_interface_id      = azurerm_network_interface.nic-prod.id
  network_security_group_id = azurerm_network_security_group.nsg-prod.id
}

resource "azurerm_linux_virtual_machine" "vm1-prod" {
  name                = "vm-prod"
  resource_group_name = "rg-assignment-prod"
  location            = "West Europe"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password="test@1234567"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic-prod.id,
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
