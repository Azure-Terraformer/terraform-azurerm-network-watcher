resource "azurerm_network_watcher" "main" {
  name                = "nw-${var.name}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
