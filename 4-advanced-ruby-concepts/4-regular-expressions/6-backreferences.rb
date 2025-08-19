### Backreferences

# You can refer to previously captured groups with \1, \2, etc.

regex = /(\w+)\s+\1/
puts "bye bye" =~ regex   # => 0 (match)
puts "hello world" =~ regex  # => nil

# Here, \1 means "repeat whatever was captured in group 1."