# Swap Case Without swapcase

# Input: "RuBy"
# Output: "rUbY"
# Hint: ASCII values with `ord` and `chr`

input = "RuBy"

# with swapcase
puts input.swapcase
# Time: O(n)
# Space: O(n) (due to new string creation)

# without swapcase
def swapcase_ascii(str)
  chars = str.chars
  chars.each_with_index do |ch, i|
    code = ch.ord
    if code >= 65 && code <= 90        # 'A'..'Z'
      chars[i] = (code + 32).chr       # Convert to lowercase
    elsif code >= 97 && code <= 122    # 'a'..'z'
      chars[i] = (code - 32).chr       # Convert to uppercase
    end
  end
  chars.join
end

puts swapcase_ascii("RuBy")  # => "rUbY"

# Time Complexity
# Iterates through the string once → O(n), where n = length of the string.
# Each operation (ord, conditional, chr) is O(1).

# Space Complexity
# The above version allocates:
# An array of characters (chars) → O(n) space.
# A new string for the result → O(n) space.
# Total: O(n) space.

## Best Space Complexity Version (O(1) extra)
def swapcase_ascii_inplace(str)
  str.length.times do |i|
    code = str[i].ord
    if code >= 65 && code <= 90
      str[i] = (code + 32).chr
    elsif code >= 97 && code <= 122
      str[i] = (code - 32).chr
    end
  end
  str
end

puts swapcase_ascii_inplace("RuBy".dup)  # => "rUbY"

# Time: O(n)
# Space: O(1) extra (in-place mutation, no new array or string except temporary chars).