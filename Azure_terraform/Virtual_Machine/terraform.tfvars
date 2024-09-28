vms = {
  vm1 = {
    subnet_name          = "public-subnet"
    virtual_network_name = "subnet-vnet"
    resource_group_name  = "rg-vm"
    nic_name             = "nic-vm1"
    location             = "Central US"
    vm_name              = "linuxmachine1"
    size                 = "Standard_F2"
  }

  vm2 = {
    subnet_name          = "private-subnet"
    virtual_network_name = "subnet-vnet"
    resource_group_name  = "rg-vm"
    nic_name             = "nic-vm2"
    location             = "Central US"
    vm_name              = "linuxmachine2"
    size                 = "Standard_F2"
  }
}
