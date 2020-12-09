//variable "AWS_REGION" {
//  default = "us-east-2"
//}
//variable "name" {
//  description = "Name to be used on all the resources as identifier"
//  default     = "Test"
//}
//variable "environment" {
//  description = "Environment in tags to identidy"
//  default     = "Dev"
//}
//variable "additional_tags" {
//  type    = map(string)
//  default = {}
//}
//variable "AMI" {
//  type = map
//  default = {
//    us-east-2 = "ami-09558250a3419e7d0"
//
//  }
//}
//variable "key_name" {
//  default = "server"
//}
//
//variable "EC2_USER" {
//  default = "ec2-user"
//}
//
//variable "private_subnet_cidr" {
//  description = "A list of private subnets inside the VPC"
//  type        = list(string)
//  default     = ["10.0.2.0/24"]
//}
//shared_credentials_file = "~/.aws/credentials"
//profile                 = "default"
//region                  = "us-west-2"

#### For VPC ########
variable "cidr_block" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "192.168.0.0/16"
}
//variable "vpc_id" {
//  description = "VPC id for existing vpc to create subnets"
//  type        = string
//  default     = ""
//}
//variable "AWS_REGION" {
//  default = "us-east-2"
//}
//variable "name" {
//  description = "Name to be used on all the resources as identifier"
//  default     = "Test"
//}
//variable "environment" {
//  description = "Environment in tags to identidy"
//  default     = "Dev"
//}
//variable "additional_tags" {
//  type    = map(string)
//  default = {}
//}
//variable "instance_tenancy" {
//  description = "A tenancy option for instances launched into the VPC"
//  type        = string
//  default     = "default"
//}
//
//variable "enable_dns_support" {
//  description = "Should be true to enable DNS support in the VPC"
//  type        = bool
//  default     = true
//}
//variable "enable_dns_hostnames" {
//  description = "Should be true to enable DNS hostnames in the VPC"
//  type        = bool
//  default     = true
//}
//
//variable "enable_classiclink" {
//  description = "boolean flag to enable/disable ClassicLink for the VPC"
//  type        = bool
//  default     = false
//}
//variable "vpc_cidr" {
//  description = "Environment in tags to identidy"
//  default     = "10.0.0.0/16"
//}
//#### Public Subent  #####
//availability_zones = ["us-east-2a", "us-east-2b" ]
//public_subnets     = ["10.58.1.0/24", "10.58.2.0/24" ]
//  #### Master Subnets  ####
//create_nat             = true
//master_private_subnets = ["10.58.6.0/23", "10.58.8.0/23", "10.58.10.0/23"]
//tier                   = "master"
//
//### For worker_nodes ###
//worker_nodes_private_subnets = ["10.58.24.0/23", "10.58.26.0/23", "10.58.28.0/23"]
//create_nat_for_nodes         = false
//
//### For Database #####
//database_private_subnets = ["10.58.60.0/24", "10.58.62.0/24", "10.58.64.0/24"]