output "vpc_id" {
  value = module.aws_vpc.vpc_id
}

output "public_subnets" {
  value = module.aws_vpc.security_groups
}
