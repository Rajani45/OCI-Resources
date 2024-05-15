resource "oci_core_ipsec_connection" "example" {
compartment_id        = var.compartment_id
cpe_id = oci_core_cpe.example.id
static_routes = ["192.168.0.0/16"]
  
}
 
resource "oci_core_cpe" "example" {
  
}
