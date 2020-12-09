variable "AWS_REGION" {
  default = "us-east-2"
}
variable "vpc_id" {
  description = "VPC id for existing vpc to create subnets"
  type        = string
  default     = null
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "Test"
}
variable "environment" {
  description = "Environment in tags to identidy"
  default     = "Dev"
}
variable "additional_tags" {
  type    = map(string)
  default = {}
}
variable "availability_zones" {
  description = "A list of availability_zones  inside the Region"
  type        = string
  default     = "us-east-2a"
}
variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = string
  default     = "10.0.2.0/24"
}
variable "vpc_cidr" {
  default = ""
}
variable "nat_gateway_ids" {
  type = string
  description = "List of Nat Gateway IDs"
  default     = null
}


