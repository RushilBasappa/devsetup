resource "helm_release" "drone" {
  name       = var.app_name
  repository = "https://charts.drone.io"
  chart      = "drone"
  namespace  = var.namespace

  values = [
    "${file("${path.module}/values.yaml")}"
  ]
}
