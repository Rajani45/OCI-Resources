provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_core_vcn" "example_vcn" {
  cidr_block     = local.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "example_vcn"
}

resource "oci_core_subnet" "example_subnet" {
  cidr_block       = local.subnet_cidr
  vcn_id           = oci_core_vcn.example_vcn.id
  compartment_id   = var.compartment_ocid
  display_name     = "example_subnet"
  dns_label        = "example"
  route_table_id   = oci_core_vcn.example_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.example_vcn.default_security_list_id]
}

resource "oci_core_instance" "example_instance" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape
  display_name        = "example_instance"
  create_vnic_details {
    subnet_id       = oci_core_subnet.example_subnet.id
    assign_public_ip = true
  }
  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_image.id
  }
}

resource "oci_load_balancer_load_balancer" "example_lb" {
  compartment_id = var.compartment_ocid
  display_name   = "example_lb"
  shape          = var.lb_shape

  subnet_ids = [
    oci_core_subnet.example_subnet.id
  ]

  backend_set {
    name   = "example_backend_set"
    policy = "ROUND_ROBIN"

    health_checker {
      protocol          = "HTTP"
      url_path          = "/"
      retries           = 3
      timeout_in_millis = 3000
      return_code       = 200
      interval_in_millis = 10000
    }
  }

  listener {
    name                  = "example_listener"
    protocol              = "HTTP"
    port                  = 80
    default_backend_set_name = "example_backend_set"
  }

  backend {
    ip_address       = oci_core_instance.example_instance.public_ip
    port             = 80
    backend_set_name = "example_backend_set"
  }
}

data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "oracle_linux_image" {
  compartment_id       = var.compartment_ocid
  operating_system     = "Oracle Linux"
  operating_system_version = "7.9"
}
