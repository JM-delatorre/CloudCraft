module "vpc" {
  source = "./vpc"
  vpc_name = "cloudcraft-vpc"
  firewall_name = "cloudcraft-firewall"
  # subnet-name = "cloudcraft-subnet"
  # subnet-ip-range = ""
}

module "vm" {
  source = "./vm"
  vm_name = "cloudcraft-vm"
  vm_machine_type = "e2-medium"
  vpc_name = module.vpc.vpc_name
}