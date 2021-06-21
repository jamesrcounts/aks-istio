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

data "kustomization_build" "apps_istio_crs" {
  path = "./apps-istio-crs"
}

resource "kustomization_resource" "apps_istio_crs" {
  depends_on = [kubernetes_namespace.apps, module.istio]

  for_each = data.kustomization_build.apps_istio_crs.ids
  manifest = data.kustomization_build.apps_istio_crs.manifests[each.value]
}