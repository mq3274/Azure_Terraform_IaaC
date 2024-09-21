data "azurerm_subnet" "frontend_subnet" {
  name                 = "example-subnet"
  virtual_network_name = "example-vnet"
  resource_group_name  = "rg2"
}
data "azurerm_resource_group" "example" {
  name = "rg2"
}

data "azurerm_key_vault" "mykeyvault" {
  name                = "key3274"
  resource_group_name = data.azurerm_resource_group.example.name
}

data "azurerm_key_vault_secret" "adminusername" {
  name         = "adminuser"
  key_vault_id = data.azurerm_key_vault.mykeyvault.id
}
data "azurerm_key_vault_secret" "adminpassword" {
  name         = "Password"
  key_vault_id = data.azurerm_key_vault.mykeyvault.id
}
