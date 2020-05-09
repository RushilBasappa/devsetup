resource "helm_release" "jenkins" {
  name      = var.app_name
  chart     = "stable/jenkins"
  namespace = var.namespace

  set {
    name  = "master.serviceType"
    value = "LoadBalancer"
  }
}
