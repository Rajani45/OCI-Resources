tenancy_ocid          = "your_tenancy_ocid"
user_ocid             = "your_user_ocid"
fingerprint           = "your_fingerprint"
private_key_path      = "/path/to/your/private/key"
region                = "your_region"
 
instance_name         = "my-oci-instance"
availability_domain   = "example_availability_domain"
compartment_id        = "example_compartment_id"
image_id              = "example_image_id"
shape                 = "example_shape"
subnet_id             = "example_subnet_id"
ssh_authorized_keys   = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQAB..."]
 
// Additional values
additional_tags = {
  environment = "development"
  project     = "project-xyz"
}
