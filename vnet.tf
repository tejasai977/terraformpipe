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

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "vmlix-subnet1"
  resource_group_name  = azurerm_resource_group.creatrg.name
  virtual_network_name = azurerm_virtual_network.createvnet.name
  address_prefixes     = [var.subnetspace1]

}

resource "azurerm_subnet" "subnet2" {
  name                 = "vmlix-subnet2"
  resource_group_name  = azurerm_resource_group.creatrg.name
  virtual_network_name = azurerm_virtual_network.createvnet.name
  address_prefixes     = [var.subnetspace2]

}

resource "azurerm_subnet_network_security_group_association" "nsgattch1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.creatensg.id
}

resource "azurerm_subnet_network_security_group_association" "nsgattch2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.creatensg.id
}

resource "azurerm_public_ip" "pub1" {
  name                = "vmlixpub"
  resource_group_name = azurerm_resource_group.creatrg.name
  location            = azurerm_resource_group.creatrg.location
  allocation_method   = "Static"
}