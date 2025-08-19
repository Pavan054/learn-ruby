### Opening and Closing Files

# Explicit open/close
file = File.open("5-file-handling/example.txt", "r")
puts file.read
file.close

# Using block (auto-close, recommended)
File.open("5-file-handling/example.txt", "r") do |f|
  puts f.read
end

# Why block form?
# Ruby ensures the file is automatically closed even if an exception occurs.