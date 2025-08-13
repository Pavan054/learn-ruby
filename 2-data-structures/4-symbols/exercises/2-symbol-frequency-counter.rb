# Challenge:
# Given an array of mixed strings and symbols, count the frequency of each unique symbol.
# Strings should be converted to symbols before counting.

# input = ["apple", :banana, "apple", :banana, :cherry, "cherry", :banana]
# Output: {:apple=>2, :banana=>3, :cherry=>2}

# 1
input = ["apple", :banana, "apple", :banana, :cherry, "cherry", :banana]
puts input.map! { |item| item.to_sym }.tally
# Time complexity: O(n) + O(n) → O(n)
# Space complexity: O(k) (for the frequency hash) + symbol table bloat if new symbols are created.

# 2
input = ["apple", :banana, "apple", :banana, :cherry, "cherry", :banana]
result = Hash.new(0)
input.map! { |item| item.to_sym }.each do |item|
    result[item]+=1
end
puts result
# Overall complexity
# Time: O(n) + O(n) → O(n)
# Space: O(k) for result hash + permanent symbol storage.

# 3 (best time and space complexity)
input = ["apple", :banana, "apple", :banana, :cherry, "cherry", :banana]

frequency = Hash.new(0)

input.each do |item|
  sym = item.is_a?(Symbol) ? item : item.to_sym
  frequency[sym] += 1
end

puts frequency      # => {:apple=>2, :banana=>3, :cherry=>2}
# Time complexity:
# Single pass over the array → O(n)
# Hash insertion/lookup is O(1) average.

# Space complexity:
# Only stores k unique symbols in the hash → O(k).