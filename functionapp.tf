data "azurerm_storage_account" "saccount" {
  name                 = "ecommercedevsamediamoya"
  resource_group_name  = var.rg
}

data "azurerm_service_plan" "sp" {
  name                 = "spfrontfrontoffice-ecommerce-dev"
  resource_group_name  = var.rg
}

# Recurso de la aplicación de función
resource "azurerm_linux_function_app" "serverless1" {
  name                     = "serverless-${ var.project }-${ var.environment }"
  resource_group_name      = var.rg
  location                 = var.location
  
  storage_account_name     = data.azurerm_storage_account.saccount.name
  storage_account_access_key = data.azurerm_storage_account.saccount.primary_access_key
  service_plan_id          = data.azurerm_service_plan.sp.id

  site_config {}
}
