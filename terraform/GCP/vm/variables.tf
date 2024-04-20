variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "vm_machine_type" {
  description = "The machine type of the VM"
  type        = string
}

variable "external_ip" {
  description = "The external IP address of the VM"
  type        = string
  
}