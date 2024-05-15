variable "compartment_id" {
  description = "The OCID of the compartment where the resources will be created"
}
 
variable "subnet_id" {
  description = "The OCID of the subnet where the compute instance will be launched"
}
 
variable "instance_shape" {
  description = "The shape of the compute instance"
  default     = "VM.Standard2.1"
}
 
variable "image_id" {
  description = "The OCID of the image to use for the compute instance"
}
 
variable "ssh_public_key" {
  description = "The SSH public key to use for accessing the compute instance"
}
 
variable "vpn_cidr_block" {
  description = "The CIDR block for the VPN connection"
}
 
variable "vpn_shared_secret" {
  description = "The shared secret for the VPN connection"
}