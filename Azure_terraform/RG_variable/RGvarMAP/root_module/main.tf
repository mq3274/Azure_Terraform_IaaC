module "servers" {
  source = "../RG"
    rg-map = {
  rg1 = {
    name     = "gullu"
    location = "centralindia"
  }
}
