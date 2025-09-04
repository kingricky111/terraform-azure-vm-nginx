output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

# Note: Standard Public IP typically shows after NIC/VM attach.
output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "ssh_command" {
  value = "ssh ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}

output "nginx_url" {
  value = "http://${azurerm_public_ip.pip.ip_address}"
}

output "metric_alert_name" {
  value = azurerm_monitor_metric_alert.cpu_high.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}