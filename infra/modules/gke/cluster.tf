resource "google_container_cluster" "cluster" {
  name                     = var.cluster_name
  location                 = var.location
  remove_default_node_pool = true
  initial_node_count       = 1

  maintenance_policy {
    daily_maintenance_window {
      start_time = "00:00"
    }
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${google_container_cluster.cluster.name} --zone  ${google_container_cluster.cluster.location} --project ${var.project_id}"
  }
}
