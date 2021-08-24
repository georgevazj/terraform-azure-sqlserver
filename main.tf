terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
  }
}

# Modules
data "azurerm_resource_group" "rsg" {
  name = var.resource_group_name
}

# Azure SQL Server
resource "azurerm_sql_server" "sql_server" {
    name = var.sql_server_name
    version = var.sql_server_version
    resource_group_name = data.azurerm_resource_group.rsg.name
    location = data.azurerm_resource_group.rsg.location
    administrator_login = var.administrator_login
    administrator_login_password = var.administrator_login_password

    tags = {
        project = var.project_tag
    }
}

# Azure SQL Database
resource "azurerm_sql_database" "sql_database" {
    name = var.sql_database_name
    resource_group_name = data.azurerm_resource_group.rsg.name
    server_name = azurerm_sql_server.sql_server.name
    location = data.azurerm_resource_group.rsg.location
    edition = var.sql_database_edition

    tags = {
        project = var.project_tag
    }
}