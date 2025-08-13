# Check if Two Strings are Anagrams

# Input: "listen", "silent"
# Output: true
# Hint: Sort and compare

# Sort and Compare
def anagram_sort?(s1, s2)
  s1.chars.sort == s2.chars.sort
end

puts anagram_sort?("listen", "silent") # true

# Time Complexity:
# .chars → O(n)
# .sort → O(n log n)
# Comparison → O(n)
# Total: O(n log n)

# Space Complexity:
# O(n) extra space for arrays and sorting.

# Count Characters (Better)
def anagram_count?(s1, s2)
  return false if s1.length != s2.length
  
  count = Hash.new(0)
  
  s1.each_char { |ch| count[ch] += 1 }
  s2.each_char { |ch| count[ch] -= 1 }
  
  count.values.all?(&:zero?)
end

puts anagram_count?("listen", "silent") # true

# Time Complexity:
# O(n) (one pass for s1, one pass for s2, one pass for checking values)

# Space Complexity:
# O(1) if alphabet is fixed (like lowercase a–z → constant 26 size hash),
# O(k) where k = number of unique characters otherwise.