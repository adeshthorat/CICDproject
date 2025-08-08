output "instance-id" {
  value       = aws_instance.this.id
  description = "value of the instance id"
}

output "instance-public-ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP of the EC2 instance"
}

output "instance-private-ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP of the EC2 instance"
}
  
