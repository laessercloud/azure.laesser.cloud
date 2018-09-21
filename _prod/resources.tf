# provider azure resource manager
provider "azurerm" { 
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
}
# prefix
variable "prefix" {
  default = ""
}
# variables
variable "subscription_id" {}, variable "client_id" {}, variable "client_secret" {}, variable "tenant_id" {},
variable "customer_shortname" {}, variable "resource_type01_name" {}, variable "resource_type01_location" {}, variable "resource_type02_name" {}, variable "resource_type02_location" {}, variable "resource_environment" {},
variable "rg_network" {}, variable "rg_compute" {}, variable "rg_storage" {}, variable "rg_application" {},
variable "tag_provider_billto" {}, variable "tag_provider_managedby" {}, variable "tag_provider_sla" {},
variable "vnet_as01" {}, variable "vnet_as01_suffix" {}, variable "vnet_as02" {}, variable "vnet_as02_suffix" {}, 
variable "vnet_dns_server1" {}, variable "vnet_dns_server2" {}, variable "vnet_dns_server3" {},
variable "as01_subnet01" {}, variable "as01_subnet02" {}, variable "as01_subnet03" {}, variable "as01_subnet04" {}, variable "as01_subnet05" {},
variable "as02_subnet01" {}, variable "as02_subnet02" {}, variable "as02_subnet03" {}, variable "as02_subnet04" {}, variable "as02_subnet05" {},
variable "as01_subnet01_name" {}, variable "as01_subnet02_name" {}, variable "as01_subnet03_name" {}, variable "as01_subnet04_name" {}, variable "as01_subnet05_name" {},
variable "as02_subnet01_name" {}, variable "as02_subnet02_name" {}, variable "as02_subnet03_name" {}, variable "as02_subnet04_name" {}, variable "as02_subnet05_name" {},
variable "nsg_suffix" {},
variable "username_default" {}, variable "password_default" {},
variable "local_network_gateway_name" {}, variable "local_network_gateway_ip" {}, variable "local_network_gateway_network" {}, 
variable "virtual_network_gateway_ip_name" {}, variable "virtual_network_gateway_name" {}, variable "virtual_network_gateway_connection_name" {}, 
variable "virtual_network_gateway_type" {}, variable "virtual_network_gateway_vpn_type" {}, variable "virtual_network_gateway_sku" {}, variable "virtual_network_gateway_public_ip_address_allocation" {},
variable "virtual_network_gateway_connection_type" {}, variable "virtual_network_gateway_connection_routing_weight" {}, variable "virtual_network_gateway_connection_shared_key" {}
variable "vm001_computer_name" {}, variable "vm001_nic_suffix" {}, variable "vm001_nic_ip_suffix" {}, variable "vm001_disk0_suffix" {}, variable "vm001_disk1_suffix" {}, 
variable "vm001_disk2_suffix" {}, variable "vm001_disk_caching" {}, variable "vm001_disk_create_option" {}, variable "vm001_disk_managed_disk_type" {}, 
variable "vm001_subnet_name" {}, variable "vm001_private_ip_address_allocation" {}, variable "vm001_vm_size" {}, variable "vm001_publisher" {}, 
variable "vm001_offer" {}, variable "vm001_sku" {}, variable "vm001_version" {}, variable "vm001_enable_automatic_upgrades" {}, 
variable "vm001_time_zone" {}, 
variable "vm002_computer_name" {}, variable "vm002_nic_suffix" {}, variable "vm002_nic_ip_suffix" {}, variable "vm002_disk0_suffix" {}, variable "vm002_disk1_suffix" {}, 
variable "vm002_disk2_suffix" {}, variable "vm002_disk_caching" {}, variable "vm002_disk_create_option" {}, variable "vm002_disk_managed_disk_type" {}, 
variable "vm002_subnet_name" {}, variable "vm002_private_ip_address_allocation" {}, variable "vm002_vm_size" {}, variable "vm002_publisher" {}, 
variable "vm002_offer" {}, variable "vm002_sku" {}, variable "vm002_version" {}, variable "vm002_enable_automatic_upgrades" {}, 
variable "vm002_time_zone" {}, 

# resource group type01 network
resource "azurerm_resource_group" "resource_type01_network" {
    name             = "${var.prefix}${var.customer_shortname}-${var.resource_type01_name}-${var.rg_network}"
    location         = "${var.resource_type01_location}"
    tags {
      environment    = "${var.resource_environment}"
      prov_billto    = "${var.tag_provider_billto}" 
      prov_managedby = "${var.tag_provider_managedby}"
      prov_sla       = "${var.tag_provider_sla}"
    }
}
# resource group type01 compute
resource "azurerm_resource_group" "resource_type01_compute" {
    name             = "${var.prefix}${var.customer_shortname}-${var.resource_type01_name}-${var.rg_compute}"
    location         = "${var.resource_type01_location}"
    tags {
      environment    = "${var.resource_environment}"
      prov_billto    = "${var.tag_provider_billto}" 
      prov_managedby = "${var.tag_provider_managedby}"
      prov_sla       = "${var.tag_provider_sla}"
    }
}
# resource group type02 network
resource "azurerm_resource_group" "resource_type02_network" {
    name             = "${var.prefix}${var.customer_shortname}-${var.resource_type02_name}-${var.rg_network}"
    location         = "${var.resource_type02_location}"
    tags {
      environment    = "${var.resource_environment}"
      prov_billto    = "${var.tag_provider_billto}" 
      prov_managedby = "${var.tag_provider_managedby}"
      prov_sla       = "${var.tag_provider_sla}"
    }
}
# resource group type02 compute
resource "azurerm_resource_group" "resource_type02_compute" {
    name             = "${var.prefix}${var.customer_shortname}-${var.resource_type02_name}-${var.rg_compute}"
    location         = "${var.resource_type02_location}"
    tags {
      environment    = "${var.resource_environment}"
      prov_billto    = "${var.tag_provider_billto}" 
      prov_managedby = "${var.tag_provider_managedby}"
      prov_sla       = "${var.tag_provider_sla}"
    }
}
# address space 01
resource "azurerm_virtual_network" "as01_vnet" {
name                = "${var.resource_type01_name}-vnet-${var.vnet_as01}-${var.vnet_as01_suffix}"
address_space       = ["${var.vnet_as01}/${var.vnet_as01_suffix}"]
dns_servers         = ["${var.vnet_dns_server1}","${var.vnet_dns_server2}","${var.vnet_dns_server3}"]
location            = "${azurerm_resource_group.resource_type01_network.location}"
resource_group_name = "${azurerm_resource_group.resource_type01_network.name}"
tags                = "${azurerm_resource_group.resource_type01_network.tags}"
}
# address space 01 subnet 01 without nsg
resource "azurerm_subnet" "as01_subnet01" {
name                 = "${var.as01_subnet01_name}"
resource_group_name  = "${azurerm_resource_group.resource_type01_network.name}"
virtual_network_name = "${azurerm_virtual_network.as01_vnet.name}"
address_prefix       = "${var.as01_subnet01}"
}
# address space 01 subnet 02 without nsg
resource "azurerm_subnet" "as01_subnet02" {
name                 = "${var.as01_subnet02_name}"
resource_group_name  = "${azurerm_resource_group.resource_type01_network.name}"
virtual_network_name = "${azurerm_virtual_network.as01_vnet.name}"
address_prefix       = "${var.as01_subnet02}"
}
# address space 01 subnet 03 with nsg
resource "azurerm_subnet" "as01_subnet03" {
name                      = "${var.resource_type01_name}-${var.as01_subnet03_name}"
resource_group_name       = "${azurerm_resource_group.resource_type01_network.name}"
virtual_network_name      = "${azurerm_virtual_network.as01_vnet.name}"
address_prefix            = "${var.as01_subnet03}"
network_security_group_id = "${azurerm_network_security_group.as01_subnet03-nsg0.id}"
}
# address space 01 subnet 04 with nsg
resource "azurerm_subnet" "as01_subnet04" {
name                      = "${var.resource_type01_name}-${var.as01_subnet04_name}"
resource_group_name       = "${azurerm_resource_group.resource_type01_network.name}"
virtual_network_name      = "${azurerm_virtual_network.as01_vnet.name}"
address_prefix            = "${var.as01_subnet04}"
network_security_group_id = "${azurerm_network_security_group.as01_subnet04-nsg0.id}"
}
# address space 01 subnet 05 with nsg
resource "azurerm_subnet" "as01_subnet05" {
name                      = "${var.resource_type01_name}-${var.as01_subnet05_name}"
resource_group_name       = "${azurerm_resource_group.resource_type01_network.name}"
virtual_network_name      = "${azurerm_virtual_network.as01_vnet.name}"
address_prefix            = "${var.as01_subnet05}"
network_security_group_id = "${azurerm_network_security_group.as01_subnet05-nsg0.id}"
}
# address space 01 subnet 03 nsg
resource "azurerm_network_security_group" "as01_subnet03-nsg0" {
  name                = "${var.resource_type01_name}-${var.as01_subnet03_name}${var.nsg_suffix}"
  resource_group_name = "${azurerm_resource_group.resource_type01_network.name}"
  location            = "${azurerm_resource_group.resource_type01_network.location}"
  tags                = "${azurerm_resource_group.resource_type01_network.tags}"
}
# address space 01 subnet 03 nsg settings
resource "azurerm_network_security_rule" "deny-tcp-all-unique-key-293898jdh34hwi3jdhsj" {
  name                        = "deny-tcp-all"
  priority                    = 4095
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = "${azurerm_resource_group.resource_type01_network.name}"
  network_security_group_name = "${azurerm_network_security_group.as01_subnet03-nsg0.name}"
}

resource "azurerm_network_security_rule" "deny-udp-all-unique-key-093873jdh34hwi3jdhsj" {
  name                        = "deny-udp-all"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = "${azurerm_resource_group.resource_type01_network.name}"
  network_security_group_name = "${azurerm_network_security_group.as01_subnet03-nsg0.name}"
}

resource "azurerm_network_security_rule" "allow-rdp-3389-rdp-unique-key-193873jdh34hwi3jdhsj" {
  name                        = "allow-rdp-3389-rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = "${azurerm_resource_group.resource_type01_network.name}"
  network_security_group_name = "${azurerm_network_security_group.as01_subnet03-nsg0.name}"
}
# address space 01 subnet 04 nsg
resource "azurerm_network_security_group" "as01_subnet04-nsg0" {
  name                = "${var.resource_type01_name}-${var.as01_subnet04_name}${var.nsg_suffix}"
  resource_group_name = "${azurerm_resource_group.resource_type01_network.name}"
  location            = "${azurerm_resource_group.resource_type01_network.location}"
  tags                = "${azurerm_resource_group.resource_type01_network.tags}"
}
# address space 01 subnet 05 nsg
resource "azurerm_network_security_group" "as01_subnet05-nsg0" {
  name                = "${var.resource_type01_name}-${var.as01_subnet05_name}${var.nsg_suffix}"
  resource_group_name = "${azurerm_resource_group.resource_type01_network.name}"
  location            = "${azurerm_resource_group.resource_type01_network.location}"
  tags                = "${azurerm_resource_group.resource_type01_network.tags}"
}

# address space 02
resource "azurerm_virtual_network" "as02_vnet" {
name                = "${var.resource_type02_name}-vnet-${var.vnet_as02}-${var.vnet_as02_suffix}"
address_space       = ["${var.vnet_as02}/${var.vnet_as02_suffix}"]
dns_servers         = ["${var.vnet_dns_server1}","${var.vnet_dns_server2}","${var.vnet_dns_server3}"]
location            = "${azurerm_resource_group.resource_type02_network.location}"
resource_group_name = "${azurerm_resource_group.resource_type02_network.name}"
tags                = "${azurerm_resource_group.resource_type02_network.tags}"
}

# address space 02 subnet 01 without nsg
resource "azurerm_subnet" "as02_subnet01" {
name                 = "${var.as02_subnet01_name}"
resource_group_name  = "${azurerm_resource_group.resource_type02_network.name}"
virtual_network_name = "${azurerm_virtual_network.as02_vnet.name}"
address_prefix       = "${var.as02_subnet01}"
}
# address space 02 subnet 02 without nsg
resource "azurerm_subnet" "as02_subnet02" {
name                 = "${var.as02_subnet02_name}"
resource_group_name  = "${azurerm_resource_group.resource_type02_network.name}"
virtual_network_name = "${azurerm_virtual_network.as02_vnet.name}"
address_prefix       = "${var.as02_subnet02}"
}
# address space 02 subnet 03 with nsg
resource "azurerm_subnet" "as02_subnet03" {
name                      = "${var.resource_type02_name}-${var.as02_subnet03_name}"
resource_group_name       = "${azurerm_resource_group.resource_type02_network.name}"
virtual_network_name      = "${azurerm_virtual_network.as02_vnet.name}"
address_prefix            = "${var.as02_subnet03}"
network_security_group_id = "${azurerm_network_security_group.as02_subnet03-nsg0.id}"

}
# address space 02 subnet 04 with nsg
resource "azurerm_subnet" "as02_subnet04" {
name                      = "${var.resource_type02_name}-${var.as02_subnet04_name}"
resource_group_name       = "${azurerm_resource_group.resource_type02_network.name}"
virtual_network_name      = "${azurerm_virtual_network.as02_vnet.name}"
address_prefix            = "${var.as02_subnet04}"
network_security_group_id = "${azurerm_network_security_group.as02_subnet04-nsg0.id}"
}
# address space 02 subnet 05 with nsg
resource "azurerm_subnet" "as02_subnet05" {
name                      = "${var.resource_type02_name}-${var.as02_subnet05_name}"
resource_group_name       = "${azurerm_resource_group.resource_type02_network.name}"
virtual_network_name      = "${azurerm_virtual_network.as02_vnet.name}"
address_prefix            = "${var.as02_subnet05}"
network_security_group_id = "${azurerm_network_security_group.as02_subnet05-nsg0.id}"
}
# address space 02 subnet 03 nsg
resource "azurerm_network_security_group" "as02_subnet03-nsg0" {
  name                = "${var.resource_type02_name}-${var.as02_subnet03_name}${var.nsg_suffix}"
  resource_group_name = "${azurerm_resource_group.resource_type02_network.name}"
  location            = "${azurerm_resource_group.resource_type02_network.location}"
  tags                = "${azurerm_resource_group.resource_type02_network.tags}"
}
# address space 02 subnet 03 nsg settings
resource "azurerm_network_security_rule" "deny-tcp-all--unique-key-293873jdk34hwi3jdhsj" {
  name                        = "deny-tcp-all"
  priority                    = 4095
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = "${azurerm_resource_group.resource_type02_network.name}"
  network_security_group_name = "${azurerm_network_security_group.as02_subnet03-nsg0.name}"
}

resource "azurerm_network_security_rule" "deny-udp-all-unique-key-293873jdh34hwi3jdhsj" {
  name                        = "deny-udp-all"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = "${azurerm_resource_group.resource_type02_network.name}"
  network_security_group_name = "${azurerm_network_security_group.as02_subnet03-nsg0.name}"
}

resource "azurerm_network_security_rule" "allow-rdp-3389-unique-key-293853jdh34hwi3jdhsj" {
  name                        = "allow-rdp-3389-rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = "${azurerm_resource_group.resource_type02_network.name}"
  network_security_group_name = "${azurerm_network_security_group.as02_subnet03-nsg0.name}"
}
# address space 02 subnet 04 nsg
resource "azurerm_network_security_group" "as02_subnet04-nsg0" {
  name                = "${var.resource_type02_name}-${var.as02_subnet04_name}${var.nsg_suffix}"
  resource_group_name = "${azurerm_resource_group.resource_type02_network.name}"
  location            = "${azurerm_resource_group.resource_type02_network.location}"
  tags                = "${azurerm_resource_group.resource_type02_network.tags}"
}
# address space 02 subnet 05 nsg
resource "azurerm_network_security_group" "as02_subnet05-nsg0" {
  name                = "${var.resource_type02_name}-${var.as02_subnet05_name}${var.nsg_suffix}"
  resource_group_name = "${azurerm_resource_group.resource_type02_network.name}"
  location            = "${azurerm_resource_group.resource_type02_network.location}"
  tags                = "${azurerm_resource_group.resource_type02_network.tags}"
}

# local gateway (on-premise)
resource "azurerm_local_network_gateway" "local_gateway" {
  name                = "${var.local_network_gateway_name}"
  resource_group_name = "${azurerm_resource_group.resource_type01_network.name}"
  location            = "${azurerm_resource_group.resource_type01_network.location}"
  gateway_address     = "${var.local_network_gateway_ip}"
  address_space       = ["${var.local_network_gateway_network}"]
  tags                = "${azurerm_resource_group.resource_type01_network.tags}"
  
}

# virtual network gateway ip (azure)
resource "azurerm_public_ip" "virtual_gateway_public_ip" {
  name                         = "${var.virtual_network_gateway_ip_name}"
  resource_group_name          = "${azurerm_resource_group.resource_type01_network.name}"
  location                     = "${azurerm_resource_group.resource_type01_network.location}"
  public_ip_address_allocation = "${var.virtual_network_gateway_public_ip_address_allocation}" 
  tags                         = "${azurerm_resource_group.resource_type01_network.tags}"
}
# virtual network gateway (azure)
resource "azurerm_virtual_network_gateway" "virtual_gateway" {
  name                = "${var.virtual_network_gateway_name}" 
  resource_group_name = "${azurerm_resource_group.resource_type01_network.name}"
  location            = "${azurerm_resource_group.resource_type01_network.location}"
  tags                = "${azurerm_resource_group.resource_type01_network.tags}"
  type                = "${var.virtual_network_gateway_type}"
  vpn_type            = "${var.virtual_network_gateway_vpn_type}"
  sku                 = "${var.virtual_network_gateway_sku}"

  ip_configuration {
    public_ip_address_id          = "${azurerm_public_ip.virtual_gateway_public_ip.id}"
    # private_ip_address_allocation = "Dynamic"  ///check if really needed
    subnet_id                     = "${azurerm_subnet.as01_subnet01.id}"
  }
}
# virtual network gateway connection (on-premise to azure)
resource "azurerm_virtual_network_gateway_connection" "local_to_azure" {
  name                       = "${var.virtual_network_gateway_connection_name}" 
  resource_group_name        = "${azurerm_resource_group.resource_type01_network.name}"
  location                   = "${azurerm_resource_group.resource_type01_network.location}"
  tags                       = "${azurerm_resource_group.resource_type01_network.tags}"
  virtual_network_gateway_id = "${azurerm_virtual_network_gateway.virtual_gateway.id}"
  local_network_gateway_id   = "${azurerm_local_network_gateway.local_gateway.id}"
  type                       = "${var.virtual_network_gateway_connection_type}"
  routing_weight             = "${var.virtual_network_gateway_connection_routing_weight}"
  shared_key                 = "${var.virtual_network_gateway_connection_shared_key}"
}
# virtual machine 001 nic
resource "azurerm_network_interface" "vm001_nic" {
  name                = "${var.vm001_computer_name}${var.vm001_nic_suffix}"
  location            = "${azurerm_resource_group.resource_type01_compute.location}"
  resource_group_name = "${azurerm_resource_group.resource_type01_compute.name}"

  ip_configuration {
    name                          = "${var.vm001_computer_name}${var.vm001_nic_ip_suffix}"
    subnet_id                     = "${azurerm_subnet.as01_subnet03.id}" # /////////subnet03!!!!!!!!!!!!!!!
    private_ip_address_allocation = "${var.vm001_private_ip_address_allocation}"   
  }
}
# virtual machine 001
  resource "azurerm_virtual_machine" "vm001" {
  name                  = "${var.vm001_computer_name}"
  location              = "${azurerm_resource_group.resource_type01_compute.location}"
  resource_group_name   = "${azurerm_resource_group.resource_type01_compute.name}"
  network_interface_ids = ["${azurerm_network_interface.vm001_nic.id}"]
  vm_size               = "${var.vm001_vm_size}"

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.vm001_publisher}"
    offer     = "${var.vm001_offer}"
    sku       = "${var.vm001_sku}"
    version   = "${var.vm001_version}"
  }

  storage_os_disk {
    name              = "${var.vm001_computer_name}${var.vm001_disk0_suffix}"
    caching           = "${var.vm001_disk_caching}"
    create_option     = "${var.vm001_disk_create_option}"
    managed_disk_type = "${var.vm001_disk_managed_disk_type}"
  }

  os_profile {
    computer_name  = "${var.vm001_computer_name}"
    admin_username = "${var.username_default}"
    admin_password = "${var.password_default}"
  }

    os_profile_windows_config {
     timezone                  = "${var.vm001_time_zone}"
     enable_automatic_upgrades = "${var.vm001_enable_automatic_upgrades}"
  }
  tags = "${azurerm_resource_group.resource_type01_network.tags}"
  }
# virtual machine 002 nic
  resource "azurerm_network_interface" "vm002_nic" {
  name                = "${var.vm002_computer_name}${var.vm002_nic_suffix}"
  location            = "${azurerm_resource_group.resource_type01_compute.location}"
  resource_group_name = "${azurerm_resource_group.resource_type01_compute.name}"

  ip_configuration {
    name                          = "${var.vm002_computer_name}${var.vm002_nic_ip_suffix}"
    subnet_id                     = "${azurerm_subnet.as01_subnet03.id}" # /////////subnet03!!!!!!!!!!!!!!!
    private_ip_address_allocation = "${var.vm002_private_ip_address_allocation}"   
  }
}
# virtual machine 002
  resource "azurerm_virtual_machine" "vm002" {
  name                  = "${var.vm002_computer_name}"
  location              = "${azurerm_resource_group.resource_type01_compute.location}"
  resource_group_name   = "${azurerm_resource_group.resource_type01_compute.name}"
  network_interface_ids = ["${azurerm_network_interface.vm002_nic.id}"]
  vm_size               = "${var.vm002_vm_size}"

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.vm002_publisher}"
    offer     = "${var.vm002_offer}"
    sku       = "${var.vm002_sku}"
    version   = "${var.vm002_version}"
  }

  storage_os_disk {
    name              = "${var.vm002_computer_name}${var.vm002_disk0_suffix}"
    caching           = "${var.vm002_disk_caching}"
    create_option     = "${var.vm002_disk_create_option}"
    managed_disk_type = "${var.vm002_disk_managed_disk_type}"
  }

  os_profile {
    computer_name  = "${var.vm002_computer_name}"
    admin_username = "${var.username_default}"
    admin_password = "${var.password_default}"
  }

    os_profile_windows_config {
     timezone                  = "${var.vm002_time_zone}"
     enable_automatic_upgrades = "${var.vm002_enable_automatic_upgrades}"
  }
  tags = "${azurerm_resource_group.resource_type01_network.tags}"
  }

  