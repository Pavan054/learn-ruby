## Symbol Sorting

# Challenge:
# Given an array of symbols, sort them alphabetically by their string value.

# Example:
# [:banana, :apple, :cherry]
# Output: [:apple, :banana, :cherry]

def sort_symbols(symbols)
  symbols.sort_by(&:to_s)
end

# Example usage
input = [:banana, :apple, :cherry]
output = sort_symbols(input)
puts output.inspect

# Explanation
# sort_by(&:to_s)
#     Converts each symbol to a string once for comparison
#     Then sorts alphabetically
#     More efficient than symbols.sort { |a, b| a.to_s <=> b.to_s } because it avoids repeated to_s calls during sorting.

# Time Complexity
#     O(n log n) — sorting complexity
#     Conversion to strings is O(n), so total is still O(n log n).
# Space Complexity
#     O(n) — temporary storage for the string representations used in sorting.

## a case-insensitive version where :Apple and :apple
def sort_symbols_case_insensitive(symbols)
  symbols.sort_by { |sym| sym.to_s.downcase }
end

# Example usage
input = [:Banana, :apple, :cherry, :Apricot]
output = sort_symbols_case_insensitive(input)
puts output.inspect

# Explanation
# sym.to_s.downcase
#     Converts each symbol to a lowercase string once before sorting
#     Ensures sorting ignores case (so :Banana and :banana are equal in order).

# Time Complexity
#     O(n log n) for sorting
#     O(n) for lowercase conversion (still dominated by sorting).
# Space Complexity
#     O(n) for storing lowercase strings used in comparison.