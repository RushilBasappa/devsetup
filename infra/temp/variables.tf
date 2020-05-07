variable "project_id" {
  type        = string
  description = "Project name."
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "gcp_cluster_count" {
  type        = string
  description = "Count of cluster instances to start."
}
variable "cluster_name" {
  type        = string
  description = "Cluster name for the GCP Cluster."
}

variable "linux_admin_username" {
  type        = string
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}
variable "linux_admin_password" {
  type        = string
  description = "The password for the Linux admin account."
}


