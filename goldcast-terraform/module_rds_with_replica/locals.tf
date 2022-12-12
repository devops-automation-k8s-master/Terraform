locals {
  name   = "replica-mysql"
  resourcenameprefix = "${var.owner}-${var.environment}-${var.project}"
  tags = {
    Owner       = var.owner
    Project     = var.project
    Environment = var.environment
    Network     = var.network
    Region      = var.region
    ManagedBy   = "Terraform"
  }

  engine                = "mysql"
  engine_version        = "8.0.27"
  family                = "mysql8.0" # DB parameter group
  major_engine_version  = "8.0"      # DB option group
  instance_class        = "db.t4g.large"
  allocated_storage     = 20
  max_allocated_storage = 100
  port                  = 3306
}