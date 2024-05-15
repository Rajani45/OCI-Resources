output "public_ip" {
  value = oci_core_instance.compute.public_ip
}
 
output "private_ip" {
  value = oci_core_instance.compute.private_ip
}
