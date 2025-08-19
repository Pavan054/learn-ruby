### Working with Directories

puts Dir.pwd                   # current working directory
puts Dir.entries(".").inspect  # list files in current dir

Dir.mkdir("5-file-handling/new-folder") unless Dir.exist?("5-file-handling/new-folder")
Dir.chdir("5-file-handling/new-folder") { puts Dir.pwd }  # temporary change

# Globbing (pattern matching)
puts Dir.glob("*.rb")          # all Ruby files
