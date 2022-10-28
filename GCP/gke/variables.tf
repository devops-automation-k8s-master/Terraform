variable "gcp_project_id" {
    type = string
    description = "GCP project id"
}

variable "gcp_region" {
    type = string
    description = "GCP region where resource will create"
}

variable "gke_cluster_name" {
    type = string
    description = "GKE cluster name"
}
variable "gke_region" {
    type = string
    description = "GKE region where nodes will be created"
}

variable "gke_zones" {
    type = list(string)
    description = "zones for gke cluster"
}

variable "gke_network_vpc_name" {
    type = string
    description = "vpc network name"
}


variable "gke_subnetwork" {
    type = string
    description = "vpc subnetwork name"
}

variable "gke_compute_nodepool_name"{
    type = string
    description = "GKE compute node pool name"
}

variable "gke_memory_utilisation_nodepool_name"{
    type = string
    description = "GKE memory utilisation node pool name"
}

variable "min_compute_node" {
    type = number
    default = 1
    description = "minimum compute node "
}

variable "max_compute_node" {
    type = number
    default = 2
    description = "maximum compute node "
}

variable "compute_node_disk_size" {
    type = number
    default = 20
    description = "size of disk in GB"
}
variable "compute_node_disk_type" {
    type = string
    default = "pd-standard"
    description = "type of disk "
}
variable "compute_node_preemptible" {
    type = bool
    default = true
    description = "compute node preemptible true | false "
}
variable "compute_node_pool_machine_type" {
    type = string
    default = "e2-medium"
    description = "machine size of compute node pool "
}

variable "min_memory_node" {
    type = number
    default = 1
    description = "minimum memory node"
}

variable "max_memory_node" {
    type = number
    default = 2
    description = "maximum memory node "
}

variable "memory_node_pool_machine_type" {
    type = string
    default = "e2-medium"
    description = "machine size of memory node pool "
}

variable "memory_node_disk_size" {
    type = number
    default = 20
    description = "size of disk in GB"
}
variable "memory_node_disk_type" {
    type = string
    default = "pd-standard"
    description = "type of disk "
}
variable "memory_node_preemptible" {
    type = bool
    default = true
    description = "memory node preemptible true | false "
}

variable "gke_service_account"{
    type = string
    description = "GKE service account name"
}

variable "gke_master_cidr_block"{
    type = string
    default = "172.16.7.0/28"
    description = "GKE master node cidr block"
}

variable "gke_regional" {
    default = "false"
}
