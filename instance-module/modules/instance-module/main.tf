resource "oci_core_instance" "my-instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  fault_domain        = var.fault_domain
  /*ssh_public_key       = var.ssh_public_key*/

  create_vnic_details {
    subnet_id = var.subnet_ocid
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }
  display_name = "tf-module_instance"
}
