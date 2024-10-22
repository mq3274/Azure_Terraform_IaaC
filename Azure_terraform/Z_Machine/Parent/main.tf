module "rg-block" {
  source  = "../Child_Module/Z_RG"
  rg-name = var.rg-mod
}

module "keyvault-block" {
  depends_on = [module.rg-block]
  source     = "../Child_Module/Z_Keyvault"
  kv         = var.kv-mod
}

module "vnet-block" {
  depends_on = [module.rg-block]
  source     = "../Child_Module/Z_VNET"
  vnet-name  = var.vm-mod
}

module "subnet-block" {
  depends_on  = [module.vnet-block]
  source      = "../Child_Module/Z_Subnet"
  subnet-name = var.subnet-mod
}

module "nsg-block" {
  depends_on = [ module.rg-block ]
  source = "../Child_Module/Z_NSG"
  nsg = var.rg-mod
  
}
module "bastion-block" {
  depends_on = [module.subnet-block]
  source     = "../Child_Module/Z_Baston"
  bastions   = var.baston-mod
}

module "vm-block" {
  depends_on = [module.subnet-block]
  source     = "../Child_Module/Z_VM"
  vm-name    = var.vm-mod
}