resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr
  display_name   = "example-vcn"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "example-igw"
  enabled        = true
}

resource "oci_core_nat_gateway" "nat" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "example-nat"
}

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  route_rules = [{
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }]
}

resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  route_rules = [{
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.nat.id
  }]
}

resource "oci_core_subnet" "subnet" {
  count = length(var.subnets)

  compartment_id       = var.compartment_ocid
  vcn_id               = oci_core_vcn.vcn.id
  cidr_block           = var.subnets[count.index].cidr
  display_name         = var.subnets[count.index].name
  availability_domain  = var.subnets[count.index].ad
  route_table_id       = var.subnets[count.index].public ? oci_core_route_table.public_rt.id : oci_core_route_table.private_rt.id

  security_list_ids = [oci_core_vcn.vcn.default_security_list_id]

  # Assign public IPs only if the subnet is public
  prohibit_public_ip_on_vnic = var.subnets[count.index].public ? false : true
}

output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "subnets" {
  value = oci_core_subnet.subnet[*].id
}
