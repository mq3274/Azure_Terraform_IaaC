
data "azurerm_subnet" "subnet-data" {
    for_each = var.vm-name
  name                 = "front-subnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_interface" "nic-block" {
  for_each            = var.vm-name
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id = ""
  }
}

resource "azurerm_linux_virtual_machine" "vm-block" {
  for_each              = var.vm-name
  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = data.azurerm_key_vault_secret.adminusername.value
  admin_password        = data.azurerm_key_vault_secret.adminpassword.value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic-block[each.key].id]
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}