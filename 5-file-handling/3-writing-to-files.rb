### Writing to Files

File.open("5-file-handling/output.txt", "w") do |f|
  f.puts "Hello, World!"
  f.write "This won't add newline"
end

# "w" → overwrite

# "a" → append

# "w+" → read & write (truncates existing)

# "a+" → read & write (appends)