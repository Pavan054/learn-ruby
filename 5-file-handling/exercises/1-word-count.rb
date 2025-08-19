### Word Count (like wc -l in Unix)
### The below ways handles large files (files with GB data also) efficiently

### Efficient way: Streaming with File.foreach
lines = 0
words = 0
chars = 0

File.foreach("5-file-handling/example.txt") do |line|
  lines += 1
  words += line.split.size
  chars += line.size
end

puts "Lines: #{lines}"
puts "Words: #{words}"
puts "Characters: #{chars}"

# File.foreach reads line by line — so at most one line is in memory.
# Very efficient for log parsing, analytics, etc.

## Processing with Enumerator (lazy evaluation)
lines = File.foreach("5-file-handling/example.txt")

word_count = lines.lazy.map { |line| line.split.size }.sum
puts "Words: #{word_count}"

# .lazy → processes line-by-line only when needed (no full memory usage).
# Elegant + performant.


