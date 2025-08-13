# sum ASCII values

# Input: "abc"
# Output: 294  (97 + 98 + 99)
# Hint: `bytes.sum`

## bytes.sum
input = "abc"
puts input.bytes.sum

# Time Complexity: O(n) (n = string length, two passes but still O(n))
# Space Complexity: O(n) (array of bytes created)

## Best Time & Space Complexity Solution
str = "abc"
ascii_sum = 0
str.each_byte { |b| ascii_sum += b }
puts ascii_sum  # 294

# Time Complexity: O(n) (single pass)
# Space Complexity: O(1) (no extra array)