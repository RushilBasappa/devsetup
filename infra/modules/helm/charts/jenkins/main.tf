resource "helm_release" "jenkins" {
  name      = var.app_name
  chart     = "stable/jenkins"
  namespace = var.namespace

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}
