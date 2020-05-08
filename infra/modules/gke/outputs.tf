output "cluster_name" {
  value = google_container_cluster.cluster.name
}

output "gcp_cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "status" {
  value = "done"
}
