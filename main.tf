module "compute_instance" {
  source = "./modules/compute_instance"
  
  compartment_id = var.compartment_id
  subnet_id = var.subnet_id
  instance_shape = var.instance_shape
  image_id = var.image_id
  ssh_public_key = var.ssh_public_key
}
 
module "vpn" {
  source = "./modules/vpn"
 
  compartment_id = var.compartment_id
  vpn_cidr_block = var.vpn_cidr_block
  vpn_shared_secret = var.vpn_shared_secret
}