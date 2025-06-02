variable "config-rg" {
  description = "allgemeine vm config"
  default = {
    vm-name             = "vm-muhammed"
    location            = "East US"
    resource-group-name = "resource-group-muhammed"
  }
}

variable "config-provider" {
  default = {
    subscription-id = "bd568ec2-e05e-468f-8315-2ef473e1f3d9"
  }
}

variable "config-network" {
  default = {
    virtual-network-name = "vn-Stephan"
    public-ip-name       = "public-ip-muhammed"
    nic-name             = "nic-muhammed"
    address-space        = ["10.0.0.0/16"]
    subnet-name          = "subnet-muhammed"
    address-prefixes     = ["10.0.1.0/24"]
  }
}

variable "config-vm" {
  default = {
    name           = "vm-muhammed"
    size           = "Standard_B2s"
    admin-username = "adminuser"

  }

}

variable "config-disk" {
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "os-disk-stephan"
  }
}

variable "config-os" {
  default = {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }
}

variable "filePath" {
  default = "./azure-key.pub"
}
