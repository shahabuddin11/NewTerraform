variable "AWS_REGION" {
  default = "us-east-2"
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
  type        = list(string)
  default     = ["us-east-2a","us-east-2b"]
}
variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

