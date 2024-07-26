module "ResourceGroup" {
  source   = "./ResourceGroup"
  name     = "dfa-lab-module-rgtst"
  location = "eastus"
}

module "Network" {
  source               = "./Network"
  virtual_network_name = "lab-module-vnet"
  subnet_name          = "lab-module-snet"
  resource_group_name  = module.ResourceGroup.rg_name_out
  location             = "eastus"
}

module "VirtualMachines" {
  source              = "./VirtualMachines"
  resource_group_name = module.ResourceGroup.rg_name_out
  subnet_id           = module.Network.subnet_id_out
  location            = "eastus"
}