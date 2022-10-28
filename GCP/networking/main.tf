module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 4.0"

    project_id   = var.gcp_project_id
    network_name = var.gke_network_vpc_name
    shared_vpc_host = false

    subnets = [
        {
            subnet_name           = var.gke_subnetwork
            subnet_ip             = var.gke_subnet_cidr
            subnet_region         = var.gcp_region
            subnet_private_access = "true"
            subnet_flow_logs      = "false"
            description           = "gke-subnet"
        }
    ]

    secondary_ranges = {
        gke-private-subnet-us-central1 = [
            {
                range_name    = "pods-address"
                ip_cidr_range = var.gke_subnet_secondary_ip_pods_cidr_range
            },
            {
                range_name    = "services-address"
                ip_cidr_range = var.gke_subnet_secondary_ip_service_cidr_range
            },
        ]
    }
}

