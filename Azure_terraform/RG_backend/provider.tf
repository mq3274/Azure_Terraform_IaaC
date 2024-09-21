terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "rg-2"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
      storage_account_name = "terraazurestorageacc1"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
      container_name       = "rg-cont"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
      key                  = "prod.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    }
}

provider "azurerm" {
  features {

  }
}