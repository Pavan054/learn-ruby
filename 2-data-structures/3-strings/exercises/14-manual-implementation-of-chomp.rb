# Manual Implementation of chomp

# Remove trailing newline from a string without using `chomp`

## Manual Slice
str = "hello\n"
str = str[0...-1] if str.end_with?("\n")
puts str  # "hello"

# Time Complexity: O(n) (string copy)
# Space Complexity: O(n) (new string without the newline)

## Regex sub
str = "hello\n"
str = str.sub(/\n$/, "")
puts str  # "hello"

# Time Complexity: O(n)
# Space Complexity: O(n)

## rstrip for all trailing whitespace
str = "hello\n"
str = str.rstrip
puts str  # "hello"
# rstrip removes all trailing whitespace, not just newline.