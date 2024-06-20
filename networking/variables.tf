variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}
variable "vcn_cidr" {
  description = "CIDR block for the VCN"
  default     = "10.0.0.0/16"
}
variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name      = string
    cidr      = string
    public    = bool
    ad        = string
  }))
  default = []
}
