resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"

    labels = {
      istio-injection = "enabled"
    }
  }
}

resource "kubernetes_cluster_role_binding" "view" {
  metadata {
    name = "default-view"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "apps"
  }
}