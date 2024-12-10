rg_list = {
  rg = "west US"
}
stg_list = {
  stg1 = {
    name                = "terraazurestorageacc1"
    resource_group_name = "rg"
    location            = "west US"
  }
}
stg_cont = {
  cont1 = {
    name                 = "vhds"
    storage_account_name = "terraazurestorageacc1"

  }
}