provider "google" {
  version = "3.20.0"

  credentials = file("${var.secret_file_path}")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

provider "helm" {
  version = "~> 1.2.1"
}

provider "kubernetes" {
  version = "~> 1.11"
}

module "create_cluster" {
  source = "../../modules/gke"

  cluster_name = var.cluster_name
  project_id   = var.project_id
  location     = var.zone
}

resource "kubernetes_namespace" "jenkins" {
  depends_on = [module.create_cluster]
  metadata {
    name = "jenkins"
  }
}

# module "setup_drone" {
#   source = "../../modules/helm/charts/drone"

#   app_name  = "drone"
#   namespace = kubernetes_namespace.drone.metadata.0.name

#   dependency = [
#     module.create_cluster.status
#   ]
# }

module "setup_jenkins" {
  source = "../../modules/helm/charts/jenkins"

  project_id = var.project_id
  app_name   = "jenkins"
  namespace  = kubernetes_namespace.jenkins.metadata.0.name

  dependency = [
    module.create_cluster.status
  ]
}
