module "aws_instance" {
  #key name should same as ./module/ec2 variables.tf 
  source          = "./module/ec2"
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  ami_id          = var.ami_id
  security_groups = var.security_groups
  root_block_device = {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = false
    kms_key_id  = null
  }
}


resource "aws_instance" "k8" {
}

module "aws_vpc" {
  source     = "./module/vpc"
  cidr-range = var.cidr-range
}
