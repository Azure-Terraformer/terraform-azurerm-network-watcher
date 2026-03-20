# Overview

This module provisions Azure Network Watcher and a corresponding Storage Account per region following best practices.

It outputs a region-indexed map that makes it easy to configure Network Flow Logs by pairing each Network Watcher with its corresponding Storage Account.

## Output

The module exposes a locations output with the following structure:

```
locations = {
  "swedencentral" = {
    "resource_group" = "rg-tftest-nmy0cg"
    "storage" = "stnfl8xyhal5g"
    "watcher" = "nw-tftest-swedencentral"
  }
  "westeurope" = {
    "resource_group" = "rg-tftest-nmy0cg"
    "storage" = "stnflimx24p2d"
    "watcher" = "nw-tftest-westeurope"
  }
}
```

## How to Use

Each key represents an Azure region. The value provides all required resources to enable flow logging:

- watcher → Network Watcher name for the region
- storage → Storage Account used for flow log retention
- resource_group → Resource group containing both resources

```
for_each = module.watcher.locations

# Example usage
network_watcher_name = each.value.watcher
storage_account_id   = each.value.storage
```

This structure allows you to easily iterate and configure flow logs:

1. Ensures correct regional pairing (required by Azure)
2. Simplifies multi-region deployments
3. Enables straightforward automation of flow logs
4. Avoids manual lookups or mismatched resources

## Test Status

- Baseline ![baseline](https://github.com/Azure-Terraformer/terraform-azurerm-network-watcher/actions/workflows/tftests-baseline.yaml/badge.svg)
- Baseline Multiple ![multiple](https://github.com/Azure-Terraformer/terraform-azurerm-network-watcher/actions/workflows/tftests-multiple.yaml/badge.svg)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_watcher.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->