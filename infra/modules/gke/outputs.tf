output "gcp_cluster_name" {
  value = google_container_cluster.cluster.name
}

output "gcp_cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

# output "gcp_ssh_command" {
#   value = "ssh ${var.linux_admin_username}@${google_container_cluster.cluster.endpoint}"
# }
