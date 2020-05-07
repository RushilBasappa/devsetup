provider "google" {
  version = "3.20.0"

  credentials = file("${var.secret_file_path}")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "micro_cluster" {
  source = "../../modules/gke"

  cluster_name = var.cluster_name
  project_id   = var.project_id
  location     = var.zone
}
