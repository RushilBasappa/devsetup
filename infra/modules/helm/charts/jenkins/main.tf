resource "helm_release" "jenkins" {
  name      = var.app_name
  chart     = "stable/jenkins"
  namespace = var.namespace

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}

module "create_service_account" {
  source = "../../../serviceaccount"

  project_id = var.project_id
}

resource "kubernetes_secret" "google-application-credentials" {
  metadata {
    name      = "jenkins-gcp-service-account"
    namespace = var.namespace
  }
  data = {
    "credentials.json" = module.create_service_account.service_account_json_key
  }
}
