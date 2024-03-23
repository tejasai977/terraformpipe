resource "azurerm_network_interface" "nic1" {
  name                = "vmlix1-nic"
  location            = azurerm_resource_group.creatrg.location
  resource_group_name = azurerm_resource_group.creatrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub1.id
  }
}

resource "azurerm_linux_virtual_machine" "vmpipe1" {
  name                = "vmpipe1mac"
  resource_group_name = azurerm_resource_group.creatrg.name
  location            = azurerm_resource_group.creatrg.location
  size                = "Standard_B1s"
  disable_password_authentication = false
  admin_username      = "adminuser"
  admin_password      = "Welcomesupport@123456"
  network_interface_ids = [
    azurerm_network_interface.nic1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}