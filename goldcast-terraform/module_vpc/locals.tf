locals {
  tags = {
    Owner       = var.owner
    Project     = var.project
    Environment = var.environment
    Network     = var.network
    Region      = var.region
    ManagedBy   = "Terraform"
  }
  resourcenameprefix = "${var.owner}-${var.environment}-${var.project}"
}