variable "gke_network_vpc_name" {
    type = string 
    description = "GKE VPC network name"
}

variable "gcp_project_id" {
    type = string
    description = "GCP project id"
}

variable "gke_region" {
    type = string
    description = "GCP region where resource will create"
}

variable "gke_vpc_nat_name" {
    type = string
    description = "gke vpc nat name"
}


variable "gke_vpc_router_name" {
    type = string
    description = "gke vpc router name"
}