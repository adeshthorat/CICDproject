#==============VPC Variables====================

variable "cidr-range" {
  default = "10.0.0.0/16"
}

#==============EC2 Varibles ./module/ec2=====================
variable "ami_id" {
  description = "AMI ID to Create Server"
  type        = string
  default     = "ami-020cba7c55df1f615"

}
variable "security_groups" {
  type    = list(string)
  default = ["sg-02f42c2ac1e34981d"]
}

variable "subnet_id" {
  description = "Subnet id"
  type        = string
  default     = "subnet-045525acab2e766c4"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
