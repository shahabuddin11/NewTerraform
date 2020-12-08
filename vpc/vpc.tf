resource "aws_vpc" "dev-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink = "false"
  instance_tenancy = "default"
  tags = merge(
  {
    "Name"        = format("%s-vpc-%s", var.name, var.environment)
    "Environment" = format("%s", var.environment)
  },
  var.additional_tags
  )
}
