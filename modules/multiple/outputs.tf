output "locations" {
  value = {
    for location, m in module.watcher :
    location => m.location
  }
}
