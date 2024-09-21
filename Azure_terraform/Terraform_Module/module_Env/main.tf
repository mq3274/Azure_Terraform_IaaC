module "rg_block" {
  source = "../Resource_group"
  rg_map = var.rg-details
}

module "sa-block" {
  depends_on  = [module.rg_block]
  source      = "../Storage_account"
  storage_map = var.sa-details
}
