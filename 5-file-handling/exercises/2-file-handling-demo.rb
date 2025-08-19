### File Handling Demo

# file_handling_demo.rb

# -----------------------------
# 1. Writing to a file
# -----------------------------
File.open("demo.txt", "w") do |f|
  f.puts "Hello, Ruby!"
  f.puts "File handling made easy."
end
puts "[✔] File written."

# -----------------------------
# 2. Reading from a file
# -----------------------------
puts "\nReading file content:"
content = File.read("demo.txt")
puts content

# -----------------------------
# 3. Appending to a file
# -----------------------------
File.open("demo.txt", "a") do |f|
  f.puts "Appending a new line."
end
puts "[✔] Appended line."

# -----------------------------
# 4. Reading line by line (streaming, memory-efficient)
# -----------------------------
puts "\nReading line by line:"
File.foreach("demo.txt").with_index do |line, i|
  puts "Line #{i+1}: #{line}"
end

# -----------------------------
# 5. File metadata
# -----------------------------
stat = File.stat("demo.txt")
puts "\nFile Metadata:"
puts "Size: #{stat.size} bytes"
puts "Last Modified: #{stat.mtime}"
puts "Permissions: #{stat.mode.to_s(8)}"

# -----------------------------
# 6. File with custom permissions
# -----------------------------
File.open("secret.txt", "w", 0600) do |f|
  f.puts "This file is private!"
end
puts "[✔] secret.txt created with permissions 0600"

# -----------------------------
# 7. Working with directories
# -----------------------------
puts "\nDirectory Operations:"
puts "Current dir: #{Dir.pwd}"
Dir.mkdir("sample_dir") unless Dir.exist?("sample_dir")
puts "Created sample_dir."

puts "Ruby files in this dir: #{Dir.glob('*.rb')}"
puts "All files in this dir: #{Dir.entries('.').inspect}"

# -----------------------------
# 8. Small real-world task (Word Count)
# -----------------------------
line_count = 0
File.foreach("demo.txt") { line_count += 1 }
puts "\n[✔] demo.txt has #{line_count} lines."
