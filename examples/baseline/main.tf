module "setup" {
  source = "../../testing/setup"

  name_prefix = var.name_prefix
  location    = var.location
}

module "watcher" {

  # points to the module under test (repo root)
  source = "../.."

  resource_group_name = module.setup.resource_group_name
  location            = module.setup.location
  name                = var.name_prefix

}
