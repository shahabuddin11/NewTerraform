
module "vpc_resource" {
  source = "./vpc"
  //  cidr_block           = var.vpc_cidr
  //  name                 = var.name
  //  enable_dns_support   = var.enable_dns_support
  //  enable_dns_hostnames = var.enable_dns_hostnames
  //  enable_classiclink =   var.enable_classiclink
  //  instance_tenancy =     var.instance_tenancy
  //  environment          = var.environment
  //  tags = merge(
  //  {
  //    "Name"        = format("%s-vpc-%s", var.name, var.environment)
  //    "Environment" = format("%s", var.environment)
  //  },
  //  var.additional_tags
  //  )
}
module "public_subnet" {
    source = "./public_subnet"
    vpc_id = module.vpc_resource.id
}
module "private_subnet" {
  source = "./private_subnet"
  vpc_id = module.vpc_resource.id
  nat_gateway_ids = module.public_subnet.nat_gateway_ids
}

//module "public_subnet" {
//  source               = "./public subnet"
//  name                 = var.name
//  environment          = var.environment
//  vpc_id               = module.vpc_resource.id
//  availability_zones   = var.availability_zones
//  public_subnets       = var.public_subnets
//  public_subnet_suffix = var.public_subnet_suffix
//  additional_tags      = local.public_subnet_tags
//}
//module "eks_master_private_subnet" {
//  source             = "./private subnet"
//  name               = var.name
//  environment        = var.environment
//  vpc_id             = module.vpc_resource.id
//  create_nat         = var.create_nat
//  availability_zones = var.availability_zones
//  private_subnets    = var.master_private_subnets
//  additional_tags    = local.private_subnet_tags
//  public_subnets_ids = module.public_subnet.public_subnet_ids
//}
//resource "aws_instance" {
//  source             = "./private subnet"
//  ami                = var.ami
//  instance_type      = var.instance_type
//  user_data          = var.user_data
//  user_data_base64   = var.user_data_base64
//  subnet_id          = var.subnet_id
//  key_name           = var.key_name
//  monitoring         = var.monitoring
//  vpc_security_group_ids = var.vpc_security_group_ids
//  iam_instance_profile = var.iam_instance_profile
//  associate_public_ip_address = var.associate_public_ip_address
//  ebs_optimized = var.ebs_optimized
//}