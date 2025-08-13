# Find All Substrings

# Input: "ruby"
# Output: ["r", "ru", "rub", "ruby", "u", "ub", "uby", "b", "by", "y"]

=begin
Understanding the Problem
For "ruby" (length = 4), the substrings are:

"r", "ru", "rub", "ruby",
"u", "ub", "uby",
"b", "by",
"y"

This is a triangular number count:
n + (n-1) + (n-2) + ... + 1 = n(n+1)/2 substrings.
Here: 4 × 5 / 2 = 10 substrings.
=end

### Best Approach
# We can generate them using two pointers and avoid unnecessary allocations where possible.
def substrings(str)
  result = []
  len = str.length
  (0...len).each do |start|
    (start...len).each do |ending|
      result << str[start..ending]
    end
  end
  result
end

p substrings("ruby")

# Time Complexity:
# Outer loop runs n times.
# Inner loop runs (n-start) times → total iterations = n(n+1)/2 = O(n²).
# Extracting a substring str[start..ending] in Ruby is O(k) where k = length of the substring,
# so the total cost of all extractions = sum of lengths of all substrings = O(n³) in the worst case if you count full copying cost.
# If we just store start/end indexes instead of actual substrings, we can keep it at O(n²).

# Space Complexity
# The output array itself holds n(n+1)/2 substrings → O(n²) total storage.
# If storing indices only (lazy evaluation), we can do O(1) extra space beyond the result references.

### Most Memory-Efficient Variant
# Instead of storing substrings immediately (which duplicates memory), store the index ranges and only slice when needed:
def substring_ranges(str)
  len = str.length
  ranges = []
  (0...len).each do |start|
    (start...len).each do |ending|
      ranges << [start, ending]
    end
  end
  ranges.map { |s, e| str[s..e] }
end

p substring_ranges("ruby")

# This avoids creating all substring objects until the final mapping step (and could even be lazy).

# Final verdict:
# Best possible time complexity: O(n²) for generating ranges, O(n³) if you physically create all substrings up front.
# Best possible space complexity: O(n²) for storing results, O(1) extra if you yield them one by one instead of storing.