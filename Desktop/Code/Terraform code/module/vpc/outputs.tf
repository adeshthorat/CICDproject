output "security_groups" {
  value = aws_security_group.app-server-sg.id
}

output "public_subnets" {
  value = aws_subnet.public_subnets.id
}

output "vpc_id" {
  value = aws_vpc.this.id
}
