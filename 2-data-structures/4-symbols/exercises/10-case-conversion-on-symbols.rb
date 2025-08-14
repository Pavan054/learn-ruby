### Case Conversion on Symbols

# Challenge:
# Given an array of symbols, return a new array where each symbol’s string value is uppercase.

# Example:
# [:ruby, :rocks]
# Output: [:RUBY, :ROCKS]

input = [:ruby, :rocks]
p input.map { |sym| sym.upcase }

# Time Complexity
#     map iterates over n elements → O(n) iterations.
#     upcase on a symbol still internally operates on the underlying string representation, so it processes k characters per symbol → O(k).
#     Overall: O(n * k)

#     Where:
#         n = number of symbols
#         k = average length of symbol names

# Space Complexity
#     map creates a new array of size n → O(n) space.
#     Each upcase call produces a new symbol (symbols are immutable) → also O(n) extra symbol objects (though they may go to Ruby’s symbol table).
#     Total Space: O(n)

## without upcase
input = [:ruby, :rocks]

result = Array.new(input.size) do |i|
  str = input[i].to_s
  chars = str.each_char.map do |ch|
    if ch >= 'a' && ch <= 'z'
      (ch.ord - 32).chr # convert lowercase to uppercase via ASCII
    else
      ch
    end
  end
  chars.join.to_sym
end

p result

# Time Complexity:
#     n = number of symbols
#     k = average length of each symbol’s name
#     O(n * k) — each character processed once.

# Space Complexity:
#     O(n) for output symbols.
#     Temporary O(k) for characters in each iteration.