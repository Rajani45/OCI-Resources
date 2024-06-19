module "compute_instance" {
  source = "./modules/compute-instance"

  compartment_ocid      = var.compartment_ocid
  availability_domain   = var.availability_domain
  shape                 = var.shape
  image_ocid            = var.image_ocid
  subnet_ocid           = var.subnet_ocid
  ssh_public_key        = var.ssh_public_key
  fault_domain          = var.fault_domain
}
