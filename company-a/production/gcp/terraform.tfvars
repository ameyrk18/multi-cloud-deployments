###############
# GKE variables
###############
cluster_name = "cluster"
network = "default"
subnetwork = "default"
location = "us-central1"
master_ipv4_cidr_block = "10.4.96.0/28"
project = "dataloop-candidate-environment"
cluster_ipv4_cidr_block = "10.4.128.0/17"
services_ipv4_cidr_block = "10.4.112.0/20"
################
# Helm variables
################
nginx_chart_name = "nginx"
nginx_chart_path = "../../../helm-charts/nginx/"
nginx_namespace = "services"
service_namespace = "monitoring"
prometheus_chart_name = "prometheus"
prometheus_chart_path = "../../../helm-charts/prometheus/"
grafana_chart_name = "grafana"
grafana_chart_path = "../../../helm-charts/grafana/"
