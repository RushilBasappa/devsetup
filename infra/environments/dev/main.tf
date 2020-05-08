provider "google" {
  version = "3.20.0"

  credentials = file("${var.secret_file_path}")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "create_cluster" {
  source = "../../modules/gke"

  cluster_name = var.cluster_name
  project_id   = var.project_id
  location     = var.zone
}

module "setup_helm" {
  source = "../../modules/helm"

  dependency = [
    module.create_cluster.status
  ]
}
