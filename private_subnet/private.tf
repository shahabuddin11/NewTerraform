
resource "aws_subnet" "private" {
  vpc_id  = var.vpc_id
  cidr_block = var.private_subnets
  availability_zone = var.availability_zones
  tags = merge(
  {
    "Name"        = format("%s-vpc-private-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )

}

resource "aws_security_group" "nat" {
  name = "vpc_nat"
  description = "Allow traffic to pass from the private subnet to the internet"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    to_port = 443
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
  vpc_id = ""
}

resource "aws_route_table" "private" {
  vpc_id            = var.vpc_id


  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id    = var.nat_gateway_ids

  }

  tags = merge(
  {
    "Name"        = format("%s-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
