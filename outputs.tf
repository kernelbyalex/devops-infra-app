output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}
 
