module "terraform-google-gke-autopilot-cluster" {
  source = "../../../terraform-modules/gcp/gke-autopilot"
  name       = "${local.env}-${var.cluster_name}"
  network    = var.network
  subnetwork = var.subnetwork
  location = var.location
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  project = var.project
  ip_allocation_policy = {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
}
