resource "azurerm_resource_group" "rg-block" {
  for_each = var.rg-map
  name     = each.key
  location = each.value
}

resource "azurerm_virtual_network" "vn-block" {
  for_each            = var.vn-map
  name                = each.value.name
  address_space       = ["10.0.0.0/16"]
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet" "sub-block" {
  for_each             = var.vn-map
  name                 = "internal-sub"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic-block" {
  for_each            = var.vn-map
  name                = "vn-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sub-block[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm-block" {
  for_each              = var.vn-map
  name                  = "mac-machine"
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = "Standard_F2"
  admin_username        = "adminuser"
  admin_password        = "Password123#"
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