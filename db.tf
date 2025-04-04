resource "azurerm_mssql_server" "sqlserver" {
    name = "dmoyabserver-${lower(var.project)}-${lower(var.environment)}"
    resource_group_name = var.rg
    location = var.location
    version = "12.0"
    administrator_login = "sqladmin"
    administrator_login_password = var.admin_sql_password

    tags = var.tags
}


resource "azurerm_mssql_database" "dbsql" {
    name = "dbsql-${lower(var.project)}-${lower(var.environment)}"
    server_id = azurerm_mssql_server.sqlserver.id
    sku_name = "S0"
    tags = var.tags
    
}

resource "azurerm_redis_cache" "cache" {
    name = "cache-${lower(var.project)}-${lower(var.environment)}"
    resource_group_name = var.rg
    location = var.location
    family = "C"
    capacity = 0
    sku_name = "Basic"
    non_ssl_port_enabled = false
    minimum_tls_version = "1.2"

    tags = var.tags
    redis_configuration {
    } 
}
