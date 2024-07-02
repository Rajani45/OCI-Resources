output "instance_public_ip" {
  value = oci_core_instance.example_instance.public_ip
}

output "load_balancer_ip" {
  value = oci_load_balancer_load_balancer.example_lb.ip_addresses[0].ip_address
}
