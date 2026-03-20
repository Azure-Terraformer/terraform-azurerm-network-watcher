variable "name" {
  type = string
}
variable "resource_group_name" {
  type        = string
  description = "Resource group where the Private DNS Zones will be created."
}
variable "locations" {
  type        = map(string)
  description = "Which locations to create the Network Watcher in. The key is used as the name of the Network Watcher and the value is used as the location."
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "networks" {
  type    = map(set(string))
  default = {}
}
variable "subnets" {
  type    = map(set(string))
  default = {}
}
