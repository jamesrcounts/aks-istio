module "svc_namespace" {
  source     = "github.com/jamesrcounts/terraform-modules.git//k8s-namespace?ref=aks"
  depends_on = [module.istio_control_plane]

  name = "svcs"
}

data "kustomization_build" "svc_istio_configuration" {
  path = "${path.module}/svc-istio-configuration"
}

resource "kustomization_resource" "svc_istio_configuration" {
  for_each = data.kustomization_build.svc_istio_configuration.ids
  manifest = data.kustomization_build.svc_istio_configuration.manifests[each.value]
}

// resource "kubernetes_network_policy" "default_deny_all" {
//   metadata {
//     name      = "default-deny-all"
//     namespace = "svcs"
//   }

//   spec {
//     pod_selector {}
//     policy_types = ["Ingress", "Egress"]
//   }
// }
