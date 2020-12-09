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

variable "vpc_cidr" {
  description = "Environment in tags to identidy"
  default     = "10.0.0.0/16"
}
variable "additional_tags" {
  type    = map(string)
  default = {}
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "boolean flag to enable/disable ClassicLink for the VPC"
  type        = bool
  default     = false
}
