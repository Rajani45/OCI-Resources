provider "oci" {
  // Provider configuration specific to compute instance
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
}
 
resource "oci_core_instance" "compute" {
  display_name          = var.instance_name
  availability_domain   = var.availability_domain
  compartment_id        = var.compartment_id
  image_id              = var.image_id
  shape                 = var.shape
  subnet_id             = var.subnet_id
  ssh_authorized_keys   = var.ssh_authorized_keys
 
  // Add more configuration as needed
}
 
// Additional input variables inside module
variable "additional_tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}
 
// Additional output variables inside module
output "ip_address" {
  value = oci_core_instance.compute.ip_address
}
 
output "tags" {
  value = merge(var.additional_tags, {
    "Name" = oci_core_instance.compute.display_name
  })
}
