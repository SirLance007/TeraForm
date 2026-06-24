variable "app_name" { type = string }
variable "image" { type = string }
variable "replicas" {
	type    = number
	default = 2
}
variable "container_port" {
    type = number
    default = 80 
}
variable "ingress_host" { type = string }
