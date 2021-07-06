module "app_namespace" {
  depends_on = [kustomization_resource.istio_control_plane_p2]
  source     = "github.com/jamesrcounts/terraform-modules.git//k8s-namespace?ref=aks"

  name = "apps"
}