variable "gcp_credentials" {
    type = string 
    description = "GCP service account key location"
}

variable "gcp_project_id" {
    type = string
    description = "GCP project id"
}

variable "gcp_region" {
    type = string
    description = "GCP region where resource will create"
}

variable "gke_network_vpc_name" {
    type = string
    description = "vpc network name"
}


variable "gke_subnetwork" {
    type = string
    description = "vpc subnetwork name"
}

variable "gke_subnet_cidr" {
    type = string
    default = "192.168.7.0/26"
    description = "gke subnet cidr block"
}


variable "gke_subnet_secondary_ip_pods_cidr_range" {
    type = string
    default = "10.7.0.0/20"
    description = "gke pods ip range"
}

variable "gke_subnet_secondary_ip_service_cidr_range" {
    type = string
    default = "10.101.0.0/23"
    description = "gke service ip range"
}
