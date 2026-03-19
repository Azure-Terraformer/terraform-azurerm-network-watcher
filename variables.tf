variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "storage_name_prefix" {
  type    = string
  default = "nfl"
}
variable "storage_account_tier" {
  type    = string
  default = "Standard"
}
variable "storage_account_kind" {
  type    = string
  default = "StorageV2"
}
variable "storage_replication_type" {
  type    = string
  default = "LRS"
}
