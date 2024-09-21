resource "azurerm_resource_group" "rg-block" {
  name     = "rg-1"
  location = "East US"
}

resource "azurerm_virtual_network" "vn-block" {
  name                = "vn-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
}

resource "azurerm_subnet" "subnet-block" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg-block.name
  virtual_network_name = azurerm_virtual_network.vn-block.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic-block" {
  name                = "nic-card"
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-block.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-block" {
  name                = "linux-machine"
  resource_group_name = azurerm_resource_group.rg-block.name
  location            = azurerm_resource_group.rg-block.location
  size                = "Standard_D2s_v3"
  admin_username      = "devopsadmin"
  network_interface_ids = [
    azurerm_network_interface.nic-block.id,
  ]

  admin_ssh_key {
    username   = "devopsadmin"
    public_key = file("C:/Users/Dell")
  }

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