provider "kubernetes" {
  version = ">= 1.4.0"
}

resource "kubernetes_service_account" "tiller" {
  depends_on = [google_container_cluster.cluster]
  metadata {
    name      = "terraform-tiller"
    namespace = "kube-system"
  }
  automount_service_account_token = true
}

resource "kubernetes_cluster_role_binding" "tiller" {
  depends_on = [google_container_cluster.cluster]
  metadata {
    name = "terraform-tiller"
  }
  role_ref {
    kind      = "ClusterRole"
    name      = "cluster-admin"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "terraform-tiller"
    namespace = "kube-system"
  }
}

provider "helm" {
  version         = "~> 0.9"
  service_account = kubernetes_service_account.tiller.metadata.0.name
  namespace       = kubernetes_service_account.tiller.metadata.0.namespace
}

resource "helm_release" "jenkins" {
  name      = "jenkins"
  chart     = "stable/jenkins"
  namespace = "jenkins"
}
