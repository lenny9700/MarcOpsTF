provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

terraform {
    backend "azurerm" {
        resource_group_name = "marcopstf"    
        storage_account_name = "tfstatedevops"
        container_name = "terraform.tfstate"
    }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "marcopsrg" {
  name     = "marcops-tf"
  location = "westeurope"
}

resource "azurerm_storage_account" "marcopssa" {
  name                     = "marcopssatf"
  resource_group_name      = azurerm_resource_group.marcopsrg.name
  location                 = azurerm_resource_group.marcopsrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}