# Input: "Ruby    is    awesome"
# Output: "Ruby is awesome"
# Hint: `squeeze` or `gsub`


input = "Ruby    is    awesome"
puts input.squeeze(" ")
puts input.gsub(/\s+/, " ")


##### avoid squeeze and gsub
str = "Ruby    is    awesome"

result = ""
prev_char = nil

str.each_char do |char|
  # Append char only if it's not a space after another space
  unless char == " " && prev_char == " "
    result << char
  end
  prev_char = char
end

puts result  # "Ruby is awesome"

# How it works?
# We loop through each character.
# Only append the current char if it’s not a space following another space.

# Time Complexity:
# O(n) — iterates through the string once, where n = string length.
# O(n) space complexity — new string is created.

##### split/join version
str = "Ruby    is    awesome"

# split without args automatically treats multiple spaces as one
result = str.split.join(" ")

puts result  # "Ruby is awesome"

# How it works?
# split without arguments splits by any whitespace sequence (spaces, tabs, newlines).
# join(" ") reassembles them with a single space between words.

# Time Complexity:
# O(n) — split and join each pass over the string once.
# O(n) space — creates an array and the joined string.