resource "random_string" "main" {
  for_each = var.resources

  length  = 8
  lower   = true
  numeric = true
  upper   = false
  special = false
}

resource "azurerm_network_watcher_flow_log" "main" {

  for_each = var.resources

  network_watcher_name = var.target.network_watcher.name
  resource_group_name  = var.target.resource_group
  name                 = "log-${random_string.resources[each.key].result}"

  target_resource_id = each.key
  storage_account_id = var.target.storage.id
  enabled            = true

  retention_policy {
    enabled = true
    days    = var.retention_policy
  }
}
