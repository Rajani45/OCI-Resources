tenancy_ocid     = "your_tenancy_ocid"
user_ocid        = "your_user_ocid"
fingerprint      = "your_fingerprint"
private_key_path = "path_to_your_private_key"
region           = "your_oci_region"

compartment_ocid = "your_compartment_ocid"
vcn_cidr         = "10.0.0.0/16"
subnets = [
  {
    name   = "public-subnet-1"
    cidr   = "10.0.1.0/24"
    public = true
    ad     = "your_ad"
  },
  {
    name   = "private-subnet-1"
    cidr   = "10.0.2.0/24"
    public = false
    ad     = "your_ad"
  }
]
