### File Permissions

File.open("5-file-handling/secret.txt", "w", 0600) do |f|
  f.puts "Only owner can read/write"
end

# The 0600 is octal → rw-------.
# Like Linux chmod.

stat = File.stat("5-file-handling/secret.txt")
puts stat.mode.to_s(8)  # permissions in octal
