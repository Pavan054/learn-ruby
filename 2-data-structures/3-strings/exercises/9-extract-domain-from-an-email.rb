# Extract Domain from an Email

# Input: "john.doe@example.com"
# Output: "example.com"
# Hint: `split('@').last`

# with split('@').last
input = "john.doe@example.com"
puts input.split('@').last

# Time Complexity → O(n)
# Space Complexity → O(n)

# without split
email = "john.doe@example.com"
domain = email[email.index('@') + 1..]
puts domain  # => "example.com"

# Time Complexity → O(n)
# Space Complexity → O(1) extra space