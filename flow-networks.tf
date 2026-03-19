resource "random_string" "networks" {
  for_each = var.networks

  length  = 8
  lower   = true
  numeric = true
  upper   = false
  special = false
}

resource "azurerm_network_watcher_flow_log" "networks" {

  for_each = var.networks

  network_watcher_name = azurerm_network_watcher.main.name
  resource_group_name  = var.resource_group_name
  name                 = "log-${random_string.networks[each.key].result}"

  target_resource_id = each.key
  storage_account_id = azurerm_storage_account.main.id
  enabled            = true

  retention_policy {
    enabled = true
    days    = var.retention_policy
  }
}
