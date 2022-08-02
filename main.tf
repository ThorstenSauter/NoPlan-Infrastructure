terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.16.0"
    }
  }

  backend "azurerm" {
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