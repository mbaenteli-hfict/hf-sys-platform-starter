# ==============================================================================
# SPRINT 4: Deklarativer Azure-Plattform-Blueprint (Terraform)
# Aufgabe: Ergänzt die markierten TODO-Blöcke und prüft mit 'terraform validate'.
# ==============================================================================

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 1. Ressourcengruppe (bereits als Beispiel vorgegeben)
resource "azurerm_resource_group" "platform" {
  name     = "rg-infte-${var.group_id}"
  location = var.location

  tags = {
    environment = "education"
    managed_by  = "terraform"
  }
}

# 2. Azure Container Registry (ACR) – Referenzbeispiel (bereits ausgefüllt)
# Hinweis: Wie bei der Ressourcengruppe dient dieser Block als Vorlage für die beiden TODO-Blöcke unten.
resource "azurerm_container_registry" "acr" {
  name                = "acrinfte${var.group_id}001"
  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location
  sku                 = "Basic"
  admin_enabled       = false
}

# 3. Log Analytics Workspace für Container-Logs
# TODO: Vervollständigt 'resource_group_name' und 'location' über Referenzen auf azurerm_resource_group.platform
resource "azurerm_log_analytics_workspace" "logs" {
  name                = "law-infte-${var.group_id}"
  resource_group_name = "TODO_RESOURCE_GROUP_NAME"
  location            = "TODO_LOCATION"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# 4. Azure Container Apps Environment (Consumption / Scale-to-Zero)
# TODO: Verknüpft 'resource_group_name', 'location' und 'log_analytics_workspace_id'
resource "azurerm_container_app_environment" "aca_env" {
  name                       = "cae-infte-${var.group_id}"
  resource_group_name        = "TODO_RESOURCE_GROUP_NAME"
  location                   = "TODO_LOCATION"
  log_analytics_workspace_id = "TODO_WORKSPACE_ID"
}
