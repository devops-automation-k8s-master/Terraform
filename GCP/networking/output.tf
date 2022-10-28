output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "project_id" {
    value = module.vpc.project_id
    description = "The name of project id in which vpc is created"
}

output "subnets_names" {
  value       = [for network in module.vpc.subnets : network.name]
  description = "The names of the subnets being created"
}

