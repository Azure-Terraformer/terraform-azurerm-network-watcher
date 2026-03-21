resource "random_string" "suffix" {
  length  = 8
  lower   = true
  numeric = true
  upper   = false
  special = false
}

locals {
  storage_account_name = "st${var.storage_name_prefix}${random_string.suffix.result}"
}
resource "azurerm_storage_account" "main" {
  name                       = "st${var.storage_name_prefix}${random_string.suffix.result}"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  account_tier               = var.storage_account_tier
  account_kind               = var.storage_account_kind
  account_replication_type   = var.storage_replication_type
  https_traffic_only_enabled = true

  tags = merge(var.tags, {
    network_watcher = local.network_watcher_name
  })
}
