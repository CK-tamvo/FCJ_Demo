resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}

// Public Subnet
resource "aws_subnet" "public_subnets" {
  for_each                = toset(var.vpc_public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = var.vpc_azs[index(var.vpc_public_subnets, each.value)]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet ${index(var.vpc_public_subnets, each.value) + 1}"
  }
}

// Create public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  tags = {
    Name = "Public Route Table"
  }
}

## Public subnet Association
resource "aws_route_table_association" "public_subnets_associations" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}
