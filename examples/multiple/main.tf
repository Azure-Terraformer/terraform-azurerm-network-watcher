module "setup" {
  source = "../../testing/setup"

  name_prefix = var.name_prefix
  location    = var.location
}

module "watcher" {

  # points to the module under test (repo root)
  source = "../../modules/multiple"

  resource_group_name = module.setup.resource_group_name
  locations           = var.locations
  name                = var.name_prefix

}
