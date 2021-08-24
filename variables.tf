# Module variables
variable "resource_group_name" {
    type = string
    description = "(Required) Target resource group"
}

# SQL Server variables
variable "sql_server_name" {
    type = string
    description = "(Required) Name of the SQL Server"
}

variable "sql_server_version" {
  type = string
  description = "(Optional) SQL Server version. Default is 12.0"
  default = "12.0"
}

variable "administrator_login" {
  type = string
  description = "(Optional) SQL Server administrator login. Default is sa"
  default = "sa"
}

variable "administrator_login_password" {
  type = string
  description = "(Optional) SQL Server administrator login password. Strong password required."
}

variable "project_tag" {
  type = string
  description = "(Optional) Project tag to be applied to the SQL Server resource"
}

# SQL database variables
variable "sql_database_name" {
    type = string
    description = "(Required) Name of the SQL Database"
}

variable "sql_database_edition" {
    type = string
    description = "(Optional) SQL Database edition. Default is 'Basic'. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web"
    default = "Basic"
}