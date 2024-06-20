module "network" {
  source = "./modules/network"

  compartment_ocid = var.compartment_ocid
  vcn_cidr         = var.vcn_cidr
  subnets          = var.subnets
}
