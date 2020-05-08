output "tiller_service_account" {
  value = kubernetes_service_account.tiller.id
}

output "tiller_clusterrole_binding" {
  value = kubernetes_cluster_role_binding.tiller.metadata[0].name
}

output "status" {
  value = "done"
}
