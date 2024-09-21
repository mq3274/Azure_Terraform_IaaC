terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "575afbf2-0d4d-4147-8f2a-ffa165367944"
  tenant_id       = "766a5e15-cdc5-4807-9e8c-ade608d0aeaa"
}