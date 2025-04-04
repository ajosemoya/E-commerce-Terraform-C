#Azure Cognitive Search
resource "azurerm_search_service" "search" {
  name = "search-${lower(var.project)}-${lower(var.environment)}"
  resource_group_name = var.rg
  location = var.location
  sku = "free"
}