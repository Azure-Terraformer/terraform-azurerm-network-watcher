module "setup" {
  source = "../../testing/setup"

  name_prefix = var.name_prefix
  location    = var.location
}

module "watcher" {

  source  = "Azure-Terraformer/network-watcher/azurerm"
  version = "1.0.6"

  resource_group_name = module.setup.resource_group_name
  location            = module.setup.location
  name                = var.name_prefix

}
