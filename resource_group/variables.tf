variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet to which the network interface will be connected."
  type        = string
}
