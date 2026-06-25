# File: tg-scratchpad/root.hcl
# Yeh block har cluster ke folder mein automatic 'backend.tf' file generate kar dega 

generate "backend" {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
    terraform {
        backend "local"{
            path = "${get_parent_terragrunt_dir()} / terraform.tfstate.d/${path_relative_to_include()}/terraform.tfstate"
        }
    }
EOF
}