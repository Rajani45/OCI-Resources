resource "oci_core_instance" "example" {
  compartment_id         = var.compartment_id
  availability_domain = data.oci_identity_availability_domains.ads.ids[0]
  shape                  = var.instance_shape
  image_id               = var.image_id
  subnet_id              = var.subnet_id
  metadata {
    ssh_authorized_keys  = var.ssh_public_key
  }
}
