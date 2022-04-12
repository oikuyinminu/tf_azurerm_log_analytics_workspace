output "object" {
    description = "Returns the object of the resource"
    value = azurerm_log_analytics_workspace.law
}

output "name" {
    description = "Returns the name of the resource"
    value = azurerm_log_analytics_workspace.law.name
}

output "id" {
    description = "Returns the ID of the resource"
    value = azurerm_log_analytics_workspace.law.id
}

output "workspace_id" {
    description = "Returns the workspace ID of the resource"
    value = azurerm_log_analytics_workspace.law.workspace_id
}