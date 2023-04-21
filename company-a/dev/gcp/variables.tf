###############
# GKE variables
###############
variable "cluster_name" {
  type = string
  default = ""
}

variable "network" {
  type = string
  default = ""
}

variable "subnetwork" {
  type = string
  default = ""
}

variable "location" {
  type = string
  default = ""
}

variable "master_ipv4_cidr_block" {
  type = string
  default = ""
}

variable "project" {
  type = string
  default = ""
}

variable "cluster_ipv4_cidr_block" {
  type = string
  default = ""
}

variable "services_ipv4_cidr_block" {
  type = string
  default = ""
}

################
# Helm variables
################
variable "nginx_chart_name" {
  type = string
  default = ""
}

variable "nginx_chart_path" {
  type = string
  default = ""
}

variable "nginx_namespace" {
  type = string
  default = ""
}

variable "prometheus_chart_name" {
  type = string
  default = ""
}

variable "prometheus_chart_path" {
  type = string
  default = ""
}

variable "service_namespace" {
  type = string
  default = ""
}

variable "grafana_chart_name" {
  type = string
  default = ""
}

variable "grafana_chart_path" {
  type = string
  default = ""
}


