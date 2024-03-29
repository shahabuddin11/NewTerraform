resource "aws_subnet" "public-1" {
  vpc_id            = var.vpc_id
  cidr_block = var.public_subnets_ids
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone = var.availability_zones
  tags = merge(
  {
    "Name"        = format("%s-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )

}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = var.vpc_id
  tags = merge(
  {
    "Name"        = format("%s-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
resource "aws_route_table" "dev-public-crt" {
  vpc_id = var.vpc_id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.dev-igw.id
  }

  tags = merge(
  {
    "Name"        = format("%s-public-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
resource "aws_route_table_association" "dev-crt-public-subnet-1"{
  subnet_id = aws_subnet.public-1.id
  route_table_id = aws_route_table.dev-public-crt.id
}
resource "aws_security_group" "ssh-allowed" {
  vpc_id = ""

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    // This means, all ip address are allowed to ssh !
    // Do not do it in the production.
    // Put your office or home address in it!
    cidr_blocks = ["0.0.0.0/0"]
  }
  //If you do not add this rule, you can not reach the NGIX
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
  {
    "Name"        = format("%s-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
resource "aws_eip" "nat_gw_eip" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public-1.id
}



