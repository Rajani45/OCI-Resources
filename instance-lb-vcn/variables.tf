variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "instance_shape" {
  default = "VM.Standard2.1"
}
variable "ssh_public_key" {}
variable "lb_shape" {
  default = "100Mbps"
}
