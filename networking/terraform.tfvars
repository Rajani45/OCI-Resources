tenancy_ocid        = "ocid1.tenancy.oc1..aaaaaaaa6yfgaxkv573qdjzpl5pyhlx4aqxgrkud5qz4jbsr4epujxepa7na"
user_ocid           = "ocid1.user.oc1..aaaaaaaafa7beolhpvyy6atnznsq27dz3wuk7cfgujor33ry3slkxop7ifsq"
fingerprint         = "d0:42:dc:69:f7:b3:47:40:89:51:e9:98:58:37:9d:96"
private_key_path    = "./private_key.pem"
region              = "eu-zurich-1"
fault_domain        = "FAULT-DOMAIN-1"
compartment_ocid    = "ocid1.compartment.oc1..aaaaaaaaxxujkwrvyv2hwgflefo32uqillschjzutpqs44um6ruqh5yr6jta"

vcn_cidr         = "10.0.0.0/16"
subnets = [
  {
    name   = "public-subnet-1"
    cidr   = "10.0.1.0/24"
    public = true
    ad     = "Wfog:EU-ZURICH-1-AD-1"
  },
  {
    name   = "private-subnet-1"
    cidr   = "10.0.2.0/24"
    public = false
    ad     = "Wfog:EU-ZURICH-1-AD-1"
  }
]
