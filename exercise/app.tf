resource "kubernetes_deployment" "test_nginx" {
    metadata {
        name      = "terraform-nginx-test"
        namespace = "default"
    }

    spec {
        replicas = 3

        selector {
            match_labels = {
                app = "nginx"
            }
        }

        template {
            metadata {
                labels = {
                app = "nginx"
                }
            }

            spec {
                container {
                image = "nginx:alpine"
                name  = "nginx"

                    port {
                        container_port = 80
                    }
                }
            }
        }
    }
}