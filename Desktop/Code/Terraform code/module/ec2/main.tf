resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups
  root_block_device {
    volume_type = var.root_block_device.volume_type
    volume_size = var.root_block_device.volume_size
    encrypted   = var.root_block_device.encrypted
    kms_key_id  = var.root_block_device.kms_key_id
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags
    ]
  }
  tags = {
    Name = "AWSAPPUS${random_integer.ServerInteger.result}"
  }

}

resource "random_integer" "SeverInteger" {
  max = 9000
  min = 1000

}
