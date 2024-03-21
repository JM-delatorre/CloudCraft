variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "cloudcraft-vpc"
  
}

# variable "subnet-name" {
#   description = "The name of the subnet"
#   type        = string
# }
# variable "subnet-ip-range" {
#   description = "The IP range of the subnet"
#   type        = string
# }

variable "firewall_name" {
  description = "The name of the firewall"
  type        = string
}