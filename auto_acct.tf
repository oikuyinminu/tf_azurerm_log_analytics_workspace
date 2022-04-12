# Create an Automation Account for every LAW
resource "azurerm_automation_account" "auto_acct" {
  for_each = var.create_auto_acct ? var.law : {}

  name                = local.auto_account_name
  location            = var.location 
  resource_group_name = var.resource_group_name

  sku_name            = "Basic"

}


resource "azurerm_log_analytics_linked_service" "law_auto" {
  for_each = var.create_auto_acct ? var.law : {}

  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.law[each.key].id
  read_access_id      = azurerm_automation_account.auto_acct[each.key].id
}