variable "tenancy_ocid" {
  description = "OCI Tenancy OCID"
  type        = string
}
 
variable "user_ocid" {
  description = "OCI User OCID"
  type        = string
}
 
variable "fingerprint" {
  description = "OCI User Fingerprint"
  type        = string
}
 
variable "private_key_path" {
  description = "Path to OCI User Private Key"
  type        = string
}
 
variable "region" {
  description = "OCI Region"
  type        = string
}
 
variable "instance_name" {
  description = "Name of the OCI compute instance"
  type        = string
}
 
variable "availability_domain" {
  description = "OCI availability domain"
  type        = string
}
 
variable "compartment_id" {
  description = "OCI compartment ID"
  type        = string
}
 
variable "image_id" {
  description = "OCI image ID"
  type        = string
}
 
variable "shape" {
  description = "OCI instance shape"
  type        = string
}
 
variable "subnet_id" {
  description = "OCI subnet ID"
  type        = string
}
 
variable "ssh_authorized_keys" {
  description = "SSH public keys authorized to access the instance"
  type        = list(string)
}
 
// Additional variables outside module
variable "additional_tags" {
  description = "Additional tags for resources"
  type        = map(string)
}
