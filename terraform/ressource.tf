resource "azurerm_resource_group" "test" {
  name     = "testResourceGroup"
  location = "West Europe"
  tags = {
    project = "T-NSA-800"
  }
}
