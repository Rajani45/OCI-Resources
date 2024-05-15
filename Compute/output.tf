output "instance_public_ip" {
  value = module.compute_instance.public_ip
}
 
output "instance_private_ip" {
  value = module.compute_instance.private_ip
}
 
// Additional outputs outside module
output "instance_tags" {
  value = module.compute_instance.tags
}
