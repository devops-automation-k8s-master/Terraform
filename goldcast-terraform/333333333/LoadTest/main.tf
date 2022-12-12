module "load-test-vpc"{
    source = "../module_vpc"
    region          = var.region
    owner           = var.owner
    environment     = var.environment
    project         = var.project
    network         = var.network
    # VPC
    cidr_block = var.cidr_block
    zones = var.zones

    private_subnets = var.private_subnets
}

module "load-test-rds" {
    source = "../module_rds_with_replica"
    region          = var.region
    owner           = var.owner
    environment     = var.environment
    project         = var.project
    network         = var.network
    depends_on = [
    module.load-test-vpc
    ]
}