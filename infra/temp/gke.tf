provider "google" {
  version = "3.20.0"

  credentials = file("./secrets/account.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_container_cluster" "cluster" {
  name                     = var.cluster_name
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1

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

resource "google_container_node_pool" "nodes" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
