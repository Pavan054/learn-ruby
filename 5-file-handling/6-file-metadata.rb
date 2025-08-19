### File Metadata

stat = File.stat("5-file-handling/example.txt")
puts stat.size       # file size in bytes
puts stat.mtime      # last modified time
puts stat.mode.to_s(8)  # permissions in octal
