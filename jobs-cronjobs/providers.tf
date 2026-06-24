terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config" # Tumhare local system ka kubeconfig path
  config_context = "kind-kind"       # Agar Docker Desktop hai toh "docker-desktop" likho
}