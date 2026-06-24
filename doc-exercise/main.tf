module "my_first_app" {
  source = "./modules/web-app"

  app_name       = "badiya-app"
  image          = "nginx:alpine" # Simple testing ke liye Nginx image
  replicas       = 2
  container_port = 80
  ingress_host   = "badiya-app.local"
}