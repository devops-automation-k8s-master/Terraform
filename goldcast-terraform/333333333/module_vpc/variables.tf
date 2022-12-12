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