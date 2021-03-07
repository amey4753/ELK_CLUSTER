#variables used in whole code 
variable "region" {
  description = "AWS Deployment region.."
  default = "ap-south-1"
}

variable "environment" {
  description = "The Deployment environment"
}

//Networking
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = string
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = string
  description = "The CIDR block for the private subnet"
}
variable "availability_zones" {
  type        = list
  description = "The az that the resources will be launched"
}

