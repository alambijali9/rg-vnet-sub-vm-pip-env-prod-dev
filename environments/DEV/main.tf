module "rg" {
  source = "../../Module_azurerm_rg"


}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../Module_azurerm_vnet"


}

module "subnet" {
  depends_on = [module.rg, module.vnet]
  source     = "../../Module_azurerm_subnet"


}

module "vm" {
  depends_on = [module.rg, module.vnet, module.subnet]
  source     = "../../Module_azurerm_vm"


}