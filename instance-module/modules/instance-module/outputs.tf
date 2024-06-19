output "instance_id" {
  value = oci_core_instance.my-instance.id
}

output "instance_ip" {
  value = oci_core_instance.my-instance.public_ip
}
