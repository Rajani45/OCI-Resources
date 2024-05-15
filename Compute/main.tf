module "compute_instance" {
  source = "./modules/compute_instance"
 
  instance_name         = var.instance_name
  availability_domain   = var.availability_domain
  compartment_id        = var.compartment_id
  image_id              = var.image_id
  shape                 = var.shape
  subnet_id             = var.subnet_id
  ssh_authorized_keys   = var.ssh_authorized_keys
  additional_tags       = var.additional_tags
 
  // Add more variables as needed
}
 
// Additional input variables outside module
variable "additional_tags" {
  description = "Additional tags for resources"
  type        = map(string)
}
 
// Additional output variables outside module
output "instance_ip_address" {
  value = module.compute_instance.ip_address
}
