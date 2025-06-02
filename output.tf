resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    vmName = azurerm_linux_virtual_machine.vm1.name
    ip     = azurerm_public_ip.public-ip.ip_address
    user   = azurerm_linux_virtual_machine.vm1.admin_username
    path   = var.filePath
  })
  filename = "${path.module}/inventory.yml"
}

output "vm_ip" {
  value = azurerm_public_ip.public-ip.ip_address
}
