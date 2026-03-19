output "watcher" {
  value = {
    id             = azurerm_network_watcher.main.id
    name           = azurerm_network_watcher.main.name
    resource_group = azurerm_network_watcher.main.resource_group_name
  }
}
output "storage" {
  value = {
    id             = azurerm_storage_account.main.id
    name           = azurerm_storage_account.main.name
    resource_group = azurerm_storage_account.main.resource_group_name
  }
}
output "location" {
  value = {
    location = {
      watcher        = azurerm_network_watcher.main.name
      storage        = azurerm_storage_account.main.name
      resource_group = azurerm_network_watcher.main.resource_group_name
    }
  }
}
