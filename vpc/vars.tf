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
variable "vpc_cidr" {
  description = "Environment in tags to identidy"
  default     = "10.0.0.0/16"
}