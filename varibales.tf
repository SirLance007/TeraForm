variable "unique_files" {
    type = list(string)
    default = ["mango-service.txt" , "apple-serive.txt"]
}

variable "for_each_files"{
    type = set(string)
    default = ["hello.txt" , "mello.txt"]
}

variable "should_i_make"{
    type = bool
    # This is oput switch
    default = true 
}

variable "company_name" {
    type = string
    default = "flipkart-devops-bhai"
}

variable "tools_list"{
    type 
}