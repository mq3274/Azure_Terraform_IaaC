
data "azurerm_key_vault" "kv" {
  name                = "kv0786"
  resource_group_name = "z-rg"
}

data "azurerm_key_vault_secret" "adminusername" {
  name         = "adminusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "adminpassword" {
  name         = "adminpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}