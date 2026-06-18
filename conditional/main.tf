resource "local_file" "conditional_file"{
    count = var.banau_kya ? 1 : 0
    filename = "${path.module}/conditional_demo.txt"
    content = "Bhai , conditional argument successfully chal gaya!!"
}