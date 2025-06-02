resource "azurerm_virtual_network" "virtual-network" {
  name                = var.config-network.virtual-network-name
  location            = azurerm_resource_group.resource-grp.location
  resource_group_name = azurerm_resource_group.resource-grp.name
  address_space       = var.config-network.address-space

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.config-network.subnet-name
  resource_group_name  = azurerm_resource_group.resource-grp.name
  virtual_network_name = azurerm_virtual_network.virtual-network.name
  address_prefixes     = var.config-network.address-prefixes
}

resource "azurerm_public_ip" "public-ip" {
  name                = var.config-network.public-ip-name
  resource_group_name = azurerm_resource_group.resource-grp.name
  location            = azurerm_resource_group.resource-grp.location
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  name                = var.config-network.nic-name
  location            = azurerm_resource_group.resource-grp.location
  resource_group_name = azurerm_resource_group.resource-grp.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }
  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "nic-sg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.security-group.id
}
