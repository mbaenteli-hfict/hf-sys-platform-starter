# ==============================================================================
# FÜR DIE SCHNELLEN: Outputs für die GitHub Variables in Event 10
# ==============================================================================

output "RESOURCE_GROUP" {
  value = azurerm_resource_group.platform.name
}

# TODO: Ergänzt die Outputs 'ACR_NAME' und 'ACA_ENV'
