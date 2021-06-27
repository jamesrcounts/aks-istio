module "app_namespace" {
  source     = "github.com/jamesrcounts/terraform-modules.git//k8s-namespace?ref=aks"
  depends_on = [module.istio_control_plane]

  name = "apps"
}