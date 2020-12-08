module "vpc_resource" {
  source               = "./vpc"
  cidr_block           = var.cidr_block
  name                 = var.name
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  environment          = var.environment
  additional_tags      = local.vpc_tags
  domain_name          = var.domain_name
}

module "public_subnet" {
  source               = "./public subnet"
  name                 = var.name
  environment          = var.environment
  vpc_id               = module.vpc_resource.id
  availability_zones   = var.availability_zones
  public_subnets       = var.public_subnets
  public_subnet_suffix = var.public_subnet_suffix
  additional_tags      = local.public_subnet_tags
}
module "eks_master_private_subnet" {
  source             = "./private subnet"
  name               = var.name
  environment        = var.environment
  vpc_id             = module.vpc_resource.id
  create_nat         = var.create_nat
  availability_zones = var.availability_zones
  private_subnets    = var.master_private_subnets
  additional_tags    = local.private_subnet_tags
  public_subnets_ids = module.public_subnet.public_subnet_ids
}
resource "aws_instance" {
  source             = "./private subnet"
  ami                = var.ami
  instance_type      = var.instance_type
  user_data          = var.user_data
  user_data_base64   = var.user_data_base64
  subnet_id          = var.subnet_id
  key_name           = var.key_name
  monitoring         = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile = var.iam_instance_profile
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized = var.ebs_optimized
}