#Details of availability zones in a given region as data input
data "aws_availability_zones" "total_az" {}

#Create AWS VPC in a given region.
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.network_base_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name = "shuttl_test_vpc"
  }
}
