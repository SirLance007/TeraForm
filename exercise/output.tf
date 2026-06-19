output "kubeconfig_location" {
    value = kind_cluster.local_k8s.kubeconfig_path
    description = "Where your kubeconfig file is saved."
}

output "cluster_endpoint" {
    value = kind_cluster.local_k8s.endpoint
    description = "The API server endpoint of the cluster"
}