# Mask Part of a String

# Input: "9876543210"
# Output: "987*****10"
# Hint: `slice` + concatenation or `sub`

# slice + concatenation
input = "9876543210"
puts  input.slice(0, 3) + "*****" + input.slice(-2, 2)

# Explanation:
# slice(0, 3) → first 3 characters "987"
# slice(-2, 2) → last 2 characters "10"
# Concatenate with "*****" in between.

# Time Complexity: O(n) (string slicing + concatenation)
# Space Complexity: O(1) extra space.

# Using sub with regex
str = "9876543210"

masked = str.sub(/(\d{3})\d+(\d{2})/, '\1*****\2')

puts masked  # "987*****10"

# Explanation:
# (\d{3}) → capture first 3 digits.
# \d+ → match the middle digits.
# (\d{2}) → capture last 2 digits.
# Replace with \1*****\2 → first capture, 5 asterisks, last capture.

# Time Complexity: O(n) (regex match + replace)
# Space Complexity: O(1) extra space.