module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gke_region
  regional                   = false
  zones                      = var.gke_zones
  network                    = var.gke_network_vpc_name
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = "pods-address"
  ip_range_services          = "services-address"
  default_max_pods_per_node  = 32
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = var.gke_master_cidr_block

  node_pools = [
    {
      name                      = var.gke_compute_nodepool_name
      machine_type              = var.compute_node_pool_machine_type
      node_locations            = ""
      min_count                 = var.min_compute_node
      max_count                 = var.max_compute_node
      local_ssd_count           = 0
      disk_size_gb              = var.compute_node_disk_size
      disk_type                 = var.compute_node_disk_type
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = var.compute_node_preemptible
      initial_node_count        = 1
      service_account           = var.gke_service_account
    },
    {
      name                      = var.gke_memory_utilisation_nodepool_name
      machine_type              = var.memory_node_pool_machine_type
      node_locations            = ""
      min_count                 = var.min_memory_node
      max_count                 = var.max_memory_node
      local_ssd_count           = 0
      disk_size_gb              = var.memory_node_disk_size
      disk_type                 = var.memory_node_disk_type
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = var.memory_node_preemptible
      initial_node_count        = 1
      service_account           = var.gke_service_account
    },
  ]

  node_pools_oauth_scopes = {
    all = ["https://www.googleapis.com/auth/cloud-platform"] 
  }

  node_pools_labels = {
    all = {}
  }

  node_pools_metadata = {
    all = {}
  }

  node_pools_taints = {
    all = []
  }

  node_pools_tags = {
    all = []
  }


}