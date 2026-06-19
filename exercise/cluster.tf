resource "kind_cluster" "local_k8s" {
    name            = "dev-cluster"
    kubeconfig_path = pathexpand("~/.kube/config")
    wait_for_ready  = true

    kind_config {
        kind        = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"

        node {
        role = "control-plane"
        }
        node {
        role = "worker"
        }
        node {
        role = "worker"
        }
    }
}