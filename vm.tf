resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = var.config-vm.name
  resource_group_name   = azurerm_resource_group.resource-grp.name
  location              = azurerm_resource_group.resource-grp.location
  size                  = var.config-vm.size
  admin_username        = var.config-vm.admin-username
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = var.config-vm.admin-username
    public_key = file(var.filePath)
  }

  os_disk {
    caching              = var.config-disk.caching
    storage_account_type = var.config-disk.storage_account_type
    name                 = var.config-disk.name
  }

  source_image_reference {
    publisher = var.config-os.publisher
    offer     = var.config-os.offer
    sku       = var.config-os.sku
    version   = var.config-os.version
  }

  tags = var.tags
}
