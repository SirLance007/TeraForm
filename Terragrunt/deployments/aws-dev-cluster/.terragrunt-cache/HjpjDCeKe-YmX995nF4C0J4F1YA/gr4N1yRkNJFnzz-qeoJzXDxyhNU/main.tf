variable "cluster_name"{
    type = string 
}

variable "gpu_count"{
    type = number 
}

# We make a dummy resource so that we can test
resource "local_file" "cluster_receipt"{
    filename = "${path.module}/cluster_info.txt"
    content = "Deploying EKS Cluster: ${var.cluster_name} with ${var.gpu_count} GPUs!"
}

