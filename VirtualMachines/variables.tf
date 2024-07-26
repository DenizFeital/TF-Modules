variable "location" {
  type        = string
  description = "Location of the Network."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "network_interface_name" {
  type        = string
  default     = "lab-lb-nic"
  description = "Name of the Network Interface."
}

variable "username" {
  type        = string
  default     = "myazureuser"
  description = "The username for the local account that will be created on the new VM."
}

variable "password" {
  type        = string
  default     = "nJaLr&zRYUt64&7yU"
  description = "The passoword for the local account that will be created on the new VM."
}

variable "virtual_machine_name" {
  type        = string
  default     = "lab-lb-vm"
  description = "Name of the Virtual Machine."
}

variable "virtual_machine_size" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "Size or SKU of the Virtual Machine."
}

variable "disk_name" {
  type        = string
  default     = "lab-lb-disk"
  description = "Name of the OS disk of the Virtual Machine."
}

variable "redundancy_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Storage redundancy type of the OS disk."
}

variable "owner_tags" {
  default     = "IT"
  description = "Default value for owner Tag."
}

variable "env_tags" {
  default     = "Test"
  description = "Default value for enviornment Tag."
}

variable "subnet_id" {
    type = string
    description = "Subnet ID"
}