output "count_filename_list"{
    value = [for file in local_file.temp-files : file.filename]
    description = "Count loop se bani saari files ki list!!!"
}

output "foreach_filenames_list"{
    value = [for name , file in local_file.pelo_files : file.filename]
    description = "Laadle For Each se banaya hai ladddleeee!!"
}

output "conditional_file"{
    value = [for file in local_file.conditional_file : file.filename]
}