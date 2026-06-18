output "capital_company_name"{
    value = upper(var.company_name)
    description = "Text ko capital karne ke liye"
}

output "joined_tools"{
    value = join(" -> , var.tools_list")
    description = "List ko ek sath jodne ke liye"
}

output "selected_ami"{
    value = lookup(var.env_ami_map , "prod" , "ami-default")
    description = "map se safe tarike se value nikalne ke liye"
}