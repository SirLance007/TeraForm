# 1. Deployment Resource
resource "kubernetes_deployment_v1" "app" {
  metadata {
    name = "${var.app_name}-deploy"
    labels = { app = var.app_name }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = { app = var.app_name }
    }
    template {
      metadata {
        labels = { app = var.app_name }
      }
      spec {
        container {
          name  = var.app_name
          image = var.image
          port { container_port = var.container_port }
        }
      }
    }
  }
}

# 2. Service Resource (Deployment ke label se binded)
resource "kubernetes_service_v1" "app_service" {
  metadata {
    name = "${var.app_name}-svc"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.app.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = var.container_port
    }
    type = "ClusterIP"
  }
}

# 3. Ingress Resource (Service ke naam se binded)
resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name = "${var.app_name}-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "false"
    }
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = var.ingress_host
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.app_service.metadata[0].name
              port { number = 80 }
            }
          }
        }
      }
    }
  }
}