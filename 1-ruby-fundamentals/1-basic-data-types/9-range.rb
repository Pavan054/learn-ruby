# Represents a sequence of values.

# Used in loops, slicing, and case expressions.

# Inclusive (..): includes the end value
p (1..5).to_a     # => [1, 2, 3, 4, 5]

# Exclusive (...): excludes the end value
p (1...5).to_a    # => [1, 2, 3, 4]

# Range with Negative Integers
p (-5..-1).to_a   # => [-5, -4, -3, -2, -1]
p (-3...2).to_a   # => [-3, -2, -1, 0, 1]
# Works as expected—Ruby maintains numeric order even with negatives.

# Range of Characters
p ('a'..'e').to_a   # => ["a", "b", "c", "d", "e"]
p ('A'...'D').to_a  # => ["A", "B", "C"]
# Useful when iterating over alphabets or generating spreadsheet-style columns ('A'..'Z').

# Using Ranges in Conditionals / Case Statements
score = 75

case score
when 90..100
  puts "Excellent"
when 70..89
  puts "Good"
when 50..69
  puts "Average"
else
  puts "Fail"
end
# This is very idiomatic Ruby and often impresses interviewers for clarity and conciseness.

# Checking Inclusion
p (1..10).include?(5)      # => true
p (1..10).include?(11)     # => false
p (1..5).cover?(3)         # => true
p (1..5).cover?(3.5)       # => true (doesn't check actual list presence)
# include? vs cover?
# include?: checks if the value exists in the range as an element.
# cover?: checks if the value falls within the range numerically or lexically (faster for large ranges).

# Ranges and Iteration
(1..5).each { |n| puts n }
5.downto(1) { |i| puts i }        # reverse range (not with ..)
# (5..1).to_a => [], because Ruby ranges go forward only.
# For descending iteration, use downto.

# Slicing Arrays with Ranges
arr = ['a', 'b', 'c', 'd']
p arr[1..2]     # => ["b", "c"]
p arr[0...3]    # => ["a", "b", "c"]
# With Negative Indexes:
p arr[-3..-1]   # => ["b", "c", "d"]
# Useful in parsing, selecting parts of arrays, strings, etc.

# Range and Step
p (1..10).step(2).to_a  # => [1, 3, 5, 7, 9]
p (1..20).step(5).to_a  # => [1, 3, 5, 7, 9]
