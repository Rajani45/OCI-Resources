output "compute_instance_private_ip" {
  value = module.compute_instance.private_ip
}
 
output "vpn_tunnel_status" {
  value = module.vpn.tunnel_status
}