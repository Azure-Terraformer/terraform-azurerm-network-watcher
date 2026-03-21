locals {
  network_watcher_name = "nw-${var.name}-${var.location}"
}
resource "azurerm_network_watcher" "main" {
  name                = "nw-${var.name}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(var.tags, {
    storage_account = local.storage_account_name
  })
}
