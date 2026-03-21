variable "target" {
  type = object({
    network_watcher = object({
      id   = string
      name = string
    })
    storage = object({
      id   = string
      name = string
    })
    resource_group = string
  })
}
variable "resources" {
  type    = set(string)
  default = []
}
variable "retention_policy" {
  type    = number
  default = 7
}
