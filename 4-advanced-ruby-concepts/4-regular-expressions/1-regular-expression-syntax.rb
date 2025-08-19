### Regular Expression Syntax

# In Ruby, regex literals are enclosed between /.../ or created with Regexp.new.

regex = /hello/
puts "hello world" =~ regex   # => 0 (match at index 0)

# =~ returns the index of match or nil if no match.
# !~ checks non-match.