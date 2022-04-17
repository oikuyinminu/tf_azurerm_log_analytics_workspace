variable "type" {
  type        = string
  description = "Abbreviation for the type of network. Should be AA, AB, BB, BC, CC."
}

variable "location" {
  description = "Region where the VM is deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group into which VM is deployed."
  type        = string
}
variable "required_tags" {
  description = "Optional - tags to apply on resource"
  type = object({
    Environment       = string
    Deployment        = string
    Environment_Owner = string
    RepositoryURL     = string
    Infrastructure    = string
    Division          = string
    CostCentre        = string
  })
}

######
## Other Variables
######

variable "optional_tags" {
  description = "(Optional) List of additional tags to applied to VM."
  type        = map(string)
  default     = {}
}

variable "instance" {
  description = "Instance numver of the deployment. Default to 1."
  type        = number
  default     = 1
}

variable "sku" {
    description = "(Optional) The SKU for the LAW."
    type = string
    default = "PerGB2018" 
}

variable "retention_in_days" {
    description = "(Optional) The data retention (in number of days) for the LAW."
    type = number
    default = 30
}

variable "linked_service_name" {
  description = "(Optional) Name of Linked Service to the Log Workplace"
  type = string
  default = "LogAutomation"
}

variable "linked_service_resource" {
 description = "(Optional) Enables Link service to the Log Workspace"
 type = object({
   enable = bool
   id = string
 })
 default = {
   enable = false
   id = null
 }

 validation {
   condition = can(regex("^(?i:/subscriptions/.+?/resourceGroups/.+?/providers/Microsoft.Automation/automationAccounts/.+|null))$", format("%v", var.linked_service_resource.id)))
   error_message = "Automation Account ID is invalid."
 }
}