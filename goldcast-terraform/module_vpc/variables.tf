# Common
variable "project" {}
variable "environment" {}
variable "region" {}
variable "network" {}
variable "owner" {}


# VPC
variable "cidr_block" {}
variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags"
}

variable "private_subnets" {
  type    = set(string)
  default = []
}
variable "zones" {
  type    = set(string)
  default = []
}

variable "database_subnets" {
  type    = set(string)
  default = []
}

variable "public_subnets" {
  type    = set(string)
  default = []
}

variable "private_subnet_names" {
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated."
  type        = list(string)
  default     = ["App","DataStore","Monitoring"]
}
