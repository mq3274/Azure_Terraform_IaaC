module "rg-block" {
  source   = "../../module/Resource_group"
  rg-map   = var.rg-mod
  location = var.location
}

module "sa-block" {
  depends_on = [module.rg-block]
  source     = "../../module/Storage_account"
  stg-map    = var.sa-mod
  location   = var.location
}

module "secgrp-block" {
  depends_on = [module.rg-block]
  source     = "../../module/security_group"
  secgrp     = var.secgrp-mod
  location   = var.location
}
module "vn-block" {
  depends_on = [module.rg-block]
  source     = "../../module/Virtual_network"
  vnet-map   = var.vn-mod
  location   = var.location
}

module "subnetblock" {
  depends_on = [module.vn-block]
  source     = "../../module/Subnet"
  sub-map    = var.sub-mod
  location   = var.location
}
