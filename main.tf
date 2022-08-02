terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.16.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraforn-state-dev-001"
    storage_account_name = "tfstatenoplandev"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    use_oidc             = true
  }

  required_version = ">= 1.2.0"
}

provider "azurerm" {
  use_oidc = true
  features {}
}

data "azurerm_client_config" "current" {}

variable "tags" {
  type = map(string)
  default = {
    "environment" : "dev"
    "project" : "noplan"
  }
  description = "The default tags for Azure resources"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location to deploy Azure resources to"
}