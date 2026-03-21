
# Reuse your base module (one zone + one vnet link)
module "watcher" {
  for_each = var.locations

  # Adjust path if your base module lives elsewhere
  source = "../.."

  resource_group_name = var.resource_group_name
  name                = var.name
  location            = each.key
  tags                = var.tags

  networks = lookup(var.networks, each.key, toset([]))
  subnets  = lookup(var.subnets, each.key, toset([]))
}
