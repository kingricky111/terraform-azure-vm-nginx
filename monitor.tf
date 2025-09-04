resource "azurerm_monitor_action_group" "notify" {
  count               = var.alert_email == "" ? 0 : 1
  name                = "${var.prefix}-ag"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "cpu80ag"

  email_receiver {
    name          = "owner"
    email_address = var.alert_email
  }
}

# Metric aler: CPU > 80% average over 5 minutes, check every 1 minutes
resource "azurerm_monitor_metric_alert" "cpu_high" {
  name                = "${var.prefix}-cpu80"
  resource_group_name = azurerm_resource_group.rg.name
  scopes              = [azurerm_linux_virtual_machine.vm.id]
  description         = "alert when VM CPU > 80% (avg over 5m)"
  severity            = 3
  frequency           = "PT1M" # evaluate every 1 minute
  window_size         = "PT5M" # lookback window 5 minutes
  auto_mitigate        = true
  enabled             = true


  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  dynamic "action" {
    for_each = var.alert_email == "" ? [] : [1]
    content {
      action_group_id = azurerm_monitor_action_group.notify[0].id
    }
  }
}