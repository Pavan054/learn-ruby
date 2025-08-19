### Reading from files

File.open("5-file-handling/example.txt", "r") do |f|
  puts f.readline      # first line
  puts "--------------------------------------"
  puts f.read          # rest of file
end

# Shortcut
content = File.read("5-file-handling/example.txt")
puts content
puts "------------------ content class is #{content.class} --------------------------"

lines = File.readlines("5-file-handling/example.txt")   # array of lines
puts lines
puts "------------------ lines class is #{lines.class} --------------------------"
