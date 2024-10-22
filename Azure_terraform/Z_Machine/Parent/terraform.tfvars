rg-mod = {
  z-rg = "Central US"
}

subnet-mod = {
  subnet1 = {
    name                 = "front-subnet"
    resource_group_name  = "z-rg"
    virtual_network_name = "z-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "back-subnet"
    resource_group_name  = "z-rg"
    virtual_network_name = "z-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "z-rg"
    virtual_network_name = "z-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

vm-mod = {
  vm1 = {
    subnet_name          = "front-subnet"
    virtual_network_name = "z-vnet"
    resource_group_name  = "z-rg"
    nic_name             = "nic-vm1"
    location             = "Central US"
    vm_name              = "Ansible"
    size                 = "Standard_F2"
  }
  vm2 = {
    subnet_name          = "back-subnet"
    virtual_network_name = "z-vnet"
    resource_group_name  = "z-rg"
    nic_name             = "nic-vm2"
    location             = "Central US"
    vm_name              = "Docker"
    size                 = "Standard_F2"
  }
}

baston-mod = {
  baston1 = {
    baston_name          = "z-bastion"
    subnet_name          = "front-subnet"
    virtual_network_name = "z-vnet"
    resource_group_name  = "z-rg"
    pubip                = "public-ip"
    location             = "Central US"
  }
}


kv-mod = {
  kv = {
    kv_name  = "kv0786"
    location = "Central US"
    rg_name  = "z-rg"

  }
}







