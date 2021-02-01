 
provider "azurerm" {
    subscription_id = "e5b7492c-0279-4a1f-9696-51440ab6c36f"
    client_id = "90de4526-b67e-4982-ac0f-2992c036de73"
    client_secret = "EOeb2R64XOh9px-6rk.KkElm1qi5NQh8wG"
    tenant_id = "e5260716-3b00-45e1-bc25-3ebf5037ebf8"
    features {}
}


#resource "azurerm_resource_group" "example" {
  #name     = "Terraform"
  #location = "East US"
#}

resource "azurerm_virtual_network" "main" {
name                = "network-demo"
resource_group_name = "Terraform"
location            = "East US"
address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal1" {
name                    = "subnet1"
resource_group_name     = "Terraform"
virtual_network_name    = "${azurerm_virtual_network.main.name}"
address_prefix          = "10.0.1.0/24"
}

resource "azurerm_public_ip" "public1" {
  name                = "public1"
  location            = "East US"
  resource_group_name = "Terraform"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_availability_set" "web_av_set" {
  name                         = "web_av_set"
  location                     = "East US"
  resource_group_name          = "Terraform"
}

resource "azurerm_network_interface" "main1" {
name                = "vm-01-nic"
location            = "East US"
resource_group_name = "Terraform"

    ip_configuration {
    name                          = "ip-vm-01"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    subnet_id                     = "${azurerm_subnet.internal1.id}"
    }
}

resource "azurerm_lb" "loadbalancer" {
  name                = "LoadBalancer"
  location            = "East US"
  resource_group_name = "Terraform"
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public1.id
  }
}


resource "azurerm_virtual_machine" "main1" {
name                                = "vm-01"
location                            = "East US"
resource_group_name                 = "Terraform"
network_interface_ids               = ["${azurerm_network_interface.main1.id}"]
vm_size                             = "Standard_A1_v2"
delete_os_disk_on_termination       = true
delete_data_disks_on_termination    = true
availability_set_id = "${azurerm_availability_set.web_av_set.id}"


    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
    }

    storage_os_disk {
    name              = "vm-01-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }

    os_profile {
    computer_name  = "vm-01"
    admin_username = "testadmin"
    admin_password = "Password1234!"
    }

    os_profile_linux_config {
    disable_password_authentication = false
    }
}

resource "azurerm_subnet" "internal2" {
name                    = "subnet2"
resource_group_name     = "Terraform"
virtual_network_name    = "${azurerm_virtual_network.main.name}"
address_prefix          = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main2" {
name                = "vm-02-nic"
location            = "East US"
resource_group_name = "Terraform"

    ip_configuration {
    name                          = "ip-vm-02"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.10"
    subnet_id                     = "${azurerm_subnet.internal2.id}"
    }
}

resource "azurerm_virtual_machine" "main2" {
name                                = "vm-02"
location                            = "East US"
resource_group_name                 = "Terraform"
network_interface_ids               = ["${azurerm_network_interface.main2.id}"]
vm_size                             = "Standard_A1_v2"
delete_os_disk_on_termination       = true
delete_data_disks_on_termination    = true
availability_set_id = "${azurerm_availability_set.web_av_set.id}"

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
    }

    storage_os_disk {
    name              = "vm-02-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }

    os_profile {
    computer_name  = "vm-02"
    admin_username = "testadmin"
    admin_password = "Password1234!"
    }

    os_profile_linux_config {
    disable_password_authentication = false
    }
}

resource "azurerm_lb_backend_address_pool" "backend_pool1" {
  resource_group_name = "Terraform"
  loadbalancer_id     = "${azurerm_lb.loadbalancer.id}"
  name                = "BackendPool1"
}

resource "azurerm_network_interface_backend_address_pool_association" "vault" {
  network_interface_id    = "${azurerm_network_interface.main1.id}"
  ip_configuration_name   = "ip-vm-01"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.backend_pool1.id}"
}

resource "azurerm_lb_backend_address_pool" "backend_pool2" {
  resource_group_name = "Terraform"
  loadbalancer_id     = "${azurerm_lb.loadbalancer.id}"
  name                = "BackendPool2"
}

resource "azurerm_network_interface_backend_address_pool_association" "vault2" {
  network_interface_id    = "${azurerm_network_interface.main2.id}"
  ip_configuration_name   = "ip-vm-02"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.backend_pool2.id}"
}