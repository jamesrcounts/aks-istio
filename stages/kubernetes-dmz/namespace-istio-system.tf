module "istio_system_namespace" {
  source = "github.com/jamesrcounts/terraform-modules.git//k8s-namespace?ref=aks"

  name = "istio-system"
}