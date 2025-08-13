#  Remove All Non-Alphabet Characters

# Input: "Ruby 3.2.0!"
# Output: "Ruby"
# Hint: `gsub(/[^a-z]/i, '')`

# with gsub(/[^a-z]/i, '')
input = "Ruby 3.2.0!"
puts input.gsub(/[^a-z]/i, '')

# Time: O(n)
# Space: O(n)

## without using gsub
str = "Ruby 3.2.0!"
result = ""

str.each_char do |char|
  if (char >= 'a' && char <= 'z') || (char >= 'A' && char <= 'Z')
    result << char
  end
end

puts result

# Time: O(n) — one pass over the string.
# Space: O(n) — for the output string (worst case all letters).