# Creat a Log Analytics Workspace

resource "azurerm_log_analytics_workspace" "law" {

  name                = local.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = var.sku
  retention_in_days = var.retention_in_days

  tags = local.tags
}