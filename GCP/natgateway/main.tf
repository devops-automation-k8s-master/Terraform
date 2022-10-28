module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.2"
  project_id = var.gcp_project_id
  region     = var.gke_region
  name       = var.gke_vpc_nat_name
  router     = var.gke_vpc_router_name
  create_router = true
  network    = var.gke_network_vpc_name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

}