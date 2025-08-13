# Center Align a String

# Input: "Ruby"
# Output: "   Ruby   " (total length 10)
# Hint: `center(10)`

# with center(10)
input = "Ruby"
p input.length
p input.center(10)
p input.center(10).length

# Time Complexity:
# O(n + m), where:
# n = length of the original string (4 here)
# m = target length (10 here)
# Ruby needs to calculate how many spaces to add on each side, then build a new string by copying the original + padding.
# In the worst case, m dominates, so O(m).

# Space Complexity:
# O(m)
# Ruby creates a new string of total length m (10 characters here).
# The original string remains untouched.

# Time: O(m)
# Space: O(m)
# If m is much larger than n, the cost comes mainly from generating and storing the padding.

## without center method
def pad_center(str, total_len)
  pad_total = total_len - str.length
  left_pad  = pad_total / 2
  right_pad = pad_total - left_pad

  ' ' * left_pad + str + ' ' * right_pad
end

puts pad_center("Ruby", 10)  # => "   Ruby   "

# Time Complexity:
# Calculating padding sizes: O(1)
# Creating padding strings: O(left_pad + right_pad) = O(m − n)
# Concatenating: O(m) (final string length m)
# Overall: O(m) — same as center, but no extra intermediate allocations like center sometimes does internally.

# Space Complexity:
# Only one final string of length m is created: O(m)
# Left/right padding created in one go, avoiding multiple intermediate padded copies.