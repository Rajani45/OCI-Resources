variable "compartment_ocid" {}
variable "vcn_cidr" {
  description = "CIDR block for the VCN"
}
variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name      = string
    cidr      = string
    public    = bool
    ad        = string
  }))
}
