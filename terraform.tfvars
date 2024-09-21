location = "EastUS"

rg-mod = {
  name = "rg1"
}

sa-mod = {
  stg1 = {
    name                     = "goatboatstorage"
    resource_group_name      = "rg1"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

}
secgrp-mod = {
  sec1 = {
    resource_group_name        = "rg1"
    name                       = "secgrp-1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
vn-mod = {
  vn1 = {
    name                = "vnetname"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
  }
}

sub-mod = {
  sub1 = {
    name                 = "public-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnetname"
    address_prefixes     = ["10.0.1.0/24"]
  }
  sub2 = {
    name                 = "Private-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnetname"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

