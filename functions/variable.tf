variable "company_name" {
    type = string
    default = "flipkart-devops-bhai"
}

variable "tools_list"{
    type = list(string)
    default = ["Docker" , "Kubernetes" , "Terraform"]
}

variable "env_ami_map"{
    type = map(string)
    default = {
        dev = "ami-chota-123"
        prod = "ami-bada-999"
    }
}