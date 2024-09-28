
data "azurerm_resource_group" "example" {
  name = "rg-vm"
}

data "azurerm_key_vault" "mykeyvault" {
  name                = "simi-key"
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
