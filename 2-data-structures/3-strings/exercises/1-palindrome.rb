##### String Reversal & Palindrome

# Reverse a string without using `reverse`
# Then check if it’s a palindrome
str = "madam"
# Expected Output:
# "madam is a palindrome"

def reverse_string(str)
  reversed = ""
  str.each_char { |char| reversed = char + reversed }
  reversed
end

def palindrome_check(str)
  reversed = reverse_string(str)
  if str == reversed
    "#{str} is a palindrome"
  else
    "#{str} is not a palindrome"
  end
end

# Test
puts palindrome_check("madam")   # madam is a palindrome
puts palindrome_check("hello")   # hello is not a palindrome

# Time Complexity:
# each_char → iterates over each character O(n)
# String concatenation char + reversed in this way is O(n²) because each concatenation copies the string.
# Optimized approach below avoids O(n²).

def reverse_string_optimized(str)
  chars = str.chars
  left, right = 0, chars.length - 1
  while left < right
    chars[left], chars[right] = chars[right], chars[left]
    left += 1
    right -= 1
  end
  chars.join
end

def palindrome_check_optimized(str)
  reversed = reverse_string_optimized(str)
  if str == reversed
    "#{str} is a palindrome"
  else
    "#{str} is not a palindrome"
  end
end

puts palindrome_check_optimized("madam")  # madam is a palindrome
puts palindrome_check_optimized("hello")  # hello is not a palindrome

# Time Complexity: O(n)
# Space Complexity: O(n) due to chars array (can be made O(1) if using in-place string modification).

def palindrome_in_place?(str)
  left = 0
  right = str.length - 1
  
  while left < right
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end
  
  true
end

# Usage
str = "madam"
if palindrome_in_place?(str)
  puts "#{str} is a palindrome"
else
  puts "#{str} is not a palindrome"
end

str = "hello"
if palindrome_in_place?(str)
  puts "#{str} is a palindrome"
else
  puts "#{str} is not a palindrome"
end

# Why This is Interview-Friendly

# No extra space → doesn’t store reversed string.
# Two-pointer technique → common interview pattern for strings and arrays.
# Early exit → stops the moment a mismatch is found.
# Time Complexity: O(n)
# Space Complexity: O(1)