# this block will create VPC ,Public and private subnets

#deploy vpc in us-east-region
resource "aws_vpc" "this" {
  #cidr range added in main module terraform/main.tf,variable.tf,outputs.tf
  cidr_block = var.cidr-range
  tags = {
    name = "Main-VPC"
  }
}


# Deploy the private subnets
resource "aws_subnet" "private_subnets" {
  for_each   = var.private_subnets #["private-subnet-1","private-subnet-2","private-subnet-3"]
  vpc_id     = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr-range, 8, 0)
  tags = {
    Name      = "restricted-subnet" #["private-subnet-1","private-subnet-2","private-subnet-3" ....]
    Terraform = "true"
  }
}

#Deploy the Public Subnet
resource "aws_subnet" "public_subnets" {
  # for_each   = var.public_subnets
  vpc_id     = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr-range, 8, 1)
  tags = {
    Name      = "application-subnet"
    Terraform = "true"
  }
}

#Create internet gateway for Public subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

}

#Deploy routes for Public Subnet
resource "aws_route_table" "Public_routes" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#Public Routes for Public Subnet
resource "aws_route_table_association" "public-routes" {
  route_table_id = aws_route_table.Public_routes.id
  subnet_id      = aws_subnet.public_subnets.id
}

#Security group for APPLICATION SERVER
# This will allow 80 and 22 traffic
resource "aws_security_group" "app-server-sg" {
  description = "This will allow 80 ,22 traffic"
  name        = "terraform-server-sg"
  vpc_id      = aws_vpc.this.id
  tags = {
    name = "application-sg"
  }
  ingress {
    description = "Allow http traffic"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow ssh traffic"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

