include "root" {
    path = find_in_parent_folders("root.hcl")
}

inputs = {
    cluster_name = "nvidia-dev-001"
    gpu_count = 8
}