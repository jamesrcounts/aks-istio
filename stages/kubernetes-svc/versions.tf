terraform {
  required_version = ">= 1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2"
    }
    // helm = {
    //   source  = "hashicorp/helm"
    //   version = "~> 2"
    // }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2"
    }
    kustomization = {
      source  = "kbst/kustomization"
      version = "~> 0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = local.kube_config["host"]
  client_certificate     = base64decode(local.kube_config["client_certificate"])
  client_key             = base64decode(local.kube_config["client_key"])
  cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
}

// provider "helm" {
//   kubernetes {
//     host                   = local.kube_config["host"]
//     client_certificate     = base64decode(local.kube_config["client_certificate"])
//     client_key             = base64decode(local.kube_config["client_key"])
//     cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
//   }
// }

provider "kustomization" {
  kubeconfig_raw = data.azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}