resource "azurerm_network_security_group" "creatensg" {
  name                = var.nsgname
  location            = azurerm_resource_group.creatrg.location
  resource_group_name = azurerm_resource_group.creatrg.name
}

resource "azurerm_virtual_network" "createvnet" {
  name                = var.vnetname
  location            = azurerm_resource_group.creatrg.location
  resource_group_name = azurerm_resource_group.creatrg.name
  address_space       = [var.addressspace]
  dns_servers         = [var.dnsserver, var.dnsserver2]

  subnet {
    name           = "subnet1"
    address_prefix = var.subnetspace1
    security_group = azurerm_network_security_group.creatensg.id
  }

  subnet {
    name           = "subnet2"
    address_prefix = var.subnetspace2
    security_group = azurerm_network_security_group.creatensg.id
  }

  tags = {
    environment = "Production"
  }
}