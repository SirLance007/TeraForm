resource "local_file" "temp-files"{
	count = length(var.unique_files)
	filename = "${path.module}/${var.unique_files[count.index]}"
	content = "Bhai, ye file count index ${count.index} se bani hai"
}

resource "local_file" "pelo_files" {
	for_each = var.for_each_files
	filename = "${path.module}/${each.value}"
	content = "for each use karke banayi hai ladle"
}


resource "local_file" "conditional_file" {
	count = var.should_i_make ? 1 : 0
	filename = "${path.module}/conditional_demo.txt"
	content = "Laadle conditional argument use kare hai ? 1 : 0"
}