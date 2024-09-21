resource "azurerm_public_ip" "pip" {
  name                = "publicip"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = var.location
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "nic" {
  name                = "nic-vm"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.frontend_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                            = "linux-machine"
  resource_group_name             = data.azurerm_resource_group.example.name
  location                        = var.location
  size                            = "Standard_F2"
  admin_username                  = data.azurerm_key_vault_secret.adminusername.value
  admin_password                  = data.azurerm_key_vault_secret.adminpassword.value
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id]

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