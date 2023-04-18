terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-b3-nodes" {
  name     = "b3-nodes"
  location = "eastus"
}

resource "azurerm_virtual_network" "vn-b3-nodes" {
  name                = "b3-nodes"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-b3-nodes.location
  resource_group_name = azurerm_resource_group.rg-b3-nodes.name
}

resource "azurerm_subnet" "s-b3-nodes" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg-b3-nodes.name
  virtual_network_name = azurerm_virtual_network.vn-b3-nodes.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic-b3-nodes" {
  name                = "nic-b3-nodes"
  location            = azurerm_resource_group.rg-b3-nodes.location
  resource_group_name = azurerm_resource_group.rg-b3-nodes.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.s-b3-nodes.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ip-b3-nodes.id
  }
}

resource "azurerm_public_ip" "ip-b3-nodes" {
  name                = "ip-b3-nodes"
  resource_group_name = azurerm_resource_group.rg-b3-nodes.name
  location            = azurerm_resource_group.rg-b3-nodes.location
  allocation_method   = "Static"
}

resource "azurerm_linux_virtual_machine" "vm-b3-cloudinit" {
  name                = "b3-cloudinit"
  resource_group_name = azurerm_resource_group.rg-b3-nodes.name
  location            = azurerm_resource_group.rg-b3-nodes.location
  size                = "Standard_B1s"
  admin_username      = "gibbs"
  network_interface_ids = [
    azurerm_network_interface.nic-b3-cloudinit.id,
  ]

  admin_ssh_key {
    username   = "gibbs"
    public_key = file("id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-10"
    sku       = "10"
    version   = "latest"
  }
}
