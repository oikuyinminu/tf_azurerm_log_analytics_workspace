locals {
  log_analytics_workspace_name = upper(format("%s-%s-%s-LAW-%s-%03d", var.type, local.region[lower(var.location)], local.env[lower(local.tags["Environment"])], each.key, var.instance))
  auto_account_name            = upper(format("%s-%s-%s-AA-%s-%03d", var.type, local.region[lower(var.location)], local.env[lower(local.tags["Environment"])], each.key, var.instance))
  resource_group_name          = format("%s-%s-%s-RG-%03d", var.type, local.region[lower(var.location)], local.env[lower(local.tags["Environment"])], var.instance)
  
  tags                         = var.optional_tags != "" ? merge(var.required_tags, var.optional_tags) : var.required_tags

  ########
  #Static Mapping of ENV and Regions
  ########
  env = {
    "production"    = "PRD"
    "preproduction" = "PPD"
    "development"   = "DEV"
    "test"          = "TST"
  }

  region = {
    "eastus"  = "EUS1"
    "eastus2" = "EUS2"
  }

}
