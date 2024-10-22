terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
  subscription_id = "0be867f2-a4a8-4449-b17b-99b756a87062"
  tenant_id       = "82596f51-e92d-4454-9bd7-f1d5cf35ad08"
}