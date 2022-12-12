

# Create VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                     = "${local.resourcenameprefix}-vpc"
  cidr                     = var.cidr_block
  enable_dns_hostnames     = true
  enable_dhcp_options      = true
  dhcp_options_domain_name = "${var.region}.compute.internal"
  azs                      = var.zones
  tags = merge(local.tags, var.extra_tags)
  # Private Subnet
  private_subnets    = var.private_subnets
  enable_nat_gateway = false
  private_subnet_names = var.private_subnet_names

  private_subnet_tags = {
    Type    = "private"
  }
 }

