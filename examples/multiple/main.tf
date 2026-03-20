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
  networks = {
    (azurerm_virtual_network.main.location) = toset([
      azurerm_virtual_network.main.id
    ])
  }
  subnets = {
    (azurerm_virtual_network.main.location) = toset([
      azurerm_subnet.default.id
    ])
  }
}


resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.name_prefix}"
  location            = module.setup.location
  resource_group_name = module.setup.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "snet-default"
  virtual_network_name = azurerm_virtual_network.main.name
  resource_group_name  = module.setup.resource_group_name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "main" {
  name                = "nsg-${var.name_prefix}"
  location            = module.setup.location
  resource_group_name = module.setup.resource_group_name
}
