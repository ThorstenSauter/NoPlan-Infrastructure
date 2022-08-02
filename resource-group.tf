resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-playground-dev-001"
  location = var.location
  tags     =  var.tags
}
