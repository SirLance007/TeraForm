terraform {
    required_version = ">= 1.0.0"
    required_providers {
        kind = {
            source = "tehcyx/kind"
            version = "~> 0.11.0"
        }
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "~> 2.0"
        }
    }
}

provider "kind" {}

# Explicitly link the kubernetes provider to use the cluster details 
provider "kubernetes" { 
    host = kind_cluster.local_k8s.endpoint
    client_certificate = kind_cluster.local_k8s.client_certificate
    client_key = kind_cluster.local_k8s.client_key
    cluster_ca_certificate = kind_cluster.local_k8s.cluster_ca_certificate
}