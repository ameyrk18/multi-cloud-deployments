data "google_client_config" "default" {
  depends_on = [module.terraform-google-gke-autopilot-cluster]
}

data "google_container_cluster" "gke" {
  name     = "${local.env}-${var.cluster_name}"
  location = var.location
  project = var.project
  depends_on = [module.terraform-google-gke-autopilot-cluster]
}

provider "helm" {
  kubernetes {
    host = "https://${data.google_container_cluster.gke.private_cluster_config.0.public_endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.gke.master_auth.0.cluster_ca_certificate)
  }
}

resource "helm_release" "nginx" {
  timeout = 600
  name  = var.nginx_chart_name
  chart = var.nginx_chart_path
  namespace = var.nginx_namespace
  create_namespace = true
  depends_on = [
    module.terraform-google-gke-autopilot-cluster.cluster
  ]
}

resource "helm_release" "prometheus" {
  timeout = 600
  name  = var.prometheus_chart_name
  chart = var.prometheus_chart_path
  namespace = var.service_namespace
  create_namespace = true
  depends_on = [
    module.terraform-google-gke-autopilot-cluster.cluster
  ]
}

resource "helm_release" "grafana" {
  timeout = 600
  name  = var.grafana_chart_name
  chart = var.grafana_chart_path
  namespace = var.service_namespace
  create_namespace = true
  depends_on = [
    module.terraform-google-gke-autopilot-cluster.cluster,
    helm_release.prometheus
  ]
}
