module "rg-prod" {
  source = "../../Module_azurerm_rg_prod"


}

module "vnet-prod" {
    depends_on = [ module.rg-prod ]
  source = "../../Module_azurerm_vnet_prod"


}

module "subnet-prod" {
    depends_on = [ module.rg-prod,module.vnet-prod]
  source = "../../Module_azurerm_subnet_prod"


}

module "vm-prod" {
    depends_on = [ module.rg-prod,module.vnet-prod,module.subnet-prod ]
  source = "../../Module_azurerm_vm_prod"


}