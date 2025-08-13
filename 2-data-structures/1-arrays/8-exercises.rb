### Basic Level

=begin
Print even numbers from an array
numbers = [1, 4, 7, 10, 15, 18]
# Expected output: 4, 10, 18
=end

p "Print even numbers from an array"
numbers = [1, 4, 7, 10, 15, 18]

p numbers.select { |num| num%2==0 }

p numbers.select { |num| num.even? }

numbers.each do |num|
    p num if num%2==0
end

=begin
Remove nil values from array
items = [1, nil, "apple", nil, 5]
# Expected: [1, "apple", 5]
=end

p "Remove nil values from array"
items = [1, nil, "apple", nil, 5]

p items.compact

items.delete(nil)
p items

items = [1, nil, "apple", nil, 5]

new_items = []
items.each do |item|
    next if item == nil
    new_items << item
end
p new_items

new_items = []
items.each do |item|
    next if item.nil?
    new_items << item
end
p new_items

new_items = []
items.each do |item|
    new_items << item if item != nil
end
p new_items

=begin
Reverse array without using reverse
arr = [1, 2, 3, 4]
=end

p "Reverse array without using reverse"
arr = [1, 2, 3, 4]

i = arr.length - 1
new_arr = []
while i >= 0
    new_arr << arr[i]
    i-=1
end
p new_arr

i = arr.length - 1
new_arr = []
until i == -1
    new_arr << arr[i]
    i-=1
end
p new_arr

j = arr.length - 1
new_arr = []
for j in j.downto(0)
    new_arr << arr[j]
end
p new_arr

j = arr.length - 1
new_arr = []
j.downto(0) { |i| new_arr << arr[i] }
p new_arr


### Intermediate Level

=begin
Flatten a nested array
arr = [1, [2, [3, 4]], 5]
# Expected: [1, 2, 3, 4, 5]
=end

arr = [1, [2, [3, 4]], 5]
p arr.flatten

def custom_flatten(array)
  result = []
  array.each do |element|
    if element.is_a?(Array)
      result.concat(custom_flatten(element))  # recursively flatten sub-array
    else
      result << element
    end
  end
  result
end

arr = [1, [2, [3, 4]], 5]
p custom_flatten(arr)  # => [1, 2, 3, 4, 5]


=begin
Find frequency of each element
items = ["apple", "banana", "apple", "orange", "banana"]
# Expected: {"apple"=>2, "banana"=>2, "orange"=>1}
=end

items = ["apple", "banana", "apple", "orange", "banana"]

counts = items.each_with_object(Hash.new(0)) do |item, hash|
  hash[item] += 1
end

puts counts

## Explanation:
# Hash.new(0) initializes a hash where missing keys default to 0.
# each_with_object passes this hash through the iteration.
# For each item, increment its count.

# using tally (Ruby 2.7+)
p items.tally

count = {}
items.each do |item|
    if count.key?(item)
        count[item] += 1
    else
        count[item] = 1
    end
end
p count

=begin
Remove duplicates without using uniq
arr = [1, 2, 2, 3, 4, 4, 5]
# Use a loop and manual logic
=end

p "Remove duplicates without using uniq"
arr = [1, 2, 2, 3, 4, 4, 5]

# O(n square)
new_arr = []
arr.each do |element|
    new_arr << element unless new_arr.include?(element)
end
p new_arr

# O(n)
arr = [1, 2, 2, 3, 4, 4, 5]
seen = {}
result = []

arr.each do |item|
  unless seen[item]
    seen[item] = true
    result << item
  end
end

puts result.inspect



### Advanced Level

=begin
Custom map method
Implement your own version of map using each.

def custom_map(arr)
  # Your code here
end

custom_map([1, 2, 3]) { |x| x * 2 } # => [2, 4, 6]
=end

def custom_map(arr)
  result = []
  arr.each do |element|
    result << yield(element)
  end
  result
end

# Example usage
puts custom_map([1, 2, 3]) { |x| x * 2 }.inspect
# => [2, 4, 6]

## Explanation:
# result = [] creates an empty array to store transformed elements.
# arr.each iterates over each item in the input array.
# yield(element) calls the block passed to the method.
# result << yield(element) appends the result of the block to the result array.

# Optional Enhancement with &block
def custom_map(arr, &block)
  result = []
  arr.each { |el| result << block.call(el) }
  result
end

puts custom_map([1, 2, 3]) { |x| x * 2 }.inspect


=begin
Find pairs with given sum
arr = [1, 2, 3, 4, 5]
target = 6
# Expected: [ [1,5], [2,4] ]
=end

arr = [1, 2, 3, 4, 5]
target = 6

# Solution 1: Brute Force with Loop (No duplicates, no reverse pairs) - O(n square)
arr = [1, 2, 3, 4, 5]
target = 6
result = []

arr.each_with_index do |num1, i|
  (i+1...arr.length).each do |j|
    num2 = arr[j]
    result << [num1, num2] if num1 + num2 == target
  end
end

puts result.inspect
# => [[1, 5], [2, 4]]

# Solution 2: Using a Set for O(n) time complexity
require 'set'

arr = [1, 2, 3, 4, 5]
target = 6
seen = Set.new
pairs = []

arr.each do |num|
  complement = target - num
  if seen.include?(complement)
    pairs << [complement, num]
  end
  seen << num
end

puts pairs.inspect
# => [[1, 5], [2, 4]]
# This solution avoids duplicates.
# Set ensures constant-time lookups.


=begin
Rotate an array (left shift by n positions)
arr = [1, 2, 3, 4, 5]
n = 2
# Expected: [3, 4, 5, 1, 2]
=end

# Solution 1: Using Array Slicing
arr = [1, 2, 3, 4, 5]
n = 2

rotated = arr[n..-1] + arr[0...n]
puts rotated.inspect
# => [3, 4, 5, 1, 2]

# Solution 2: Using Array#rotate (Ruby built-in)
arr = [1, 2, 3, 4, 5]
n = 2

rotated = arr.rotate(n)
puts rotated.inspect
# => [3, 4, 5, 1, 2]

# Solution 3: Manual Loop (Good for interviews)
arr = [1, 2, 3, 4, 5]
n = 2

n %= arr.length  # Handle n > arr.length
rotated = []

(arr.length).times do |i|
  rotated << arr[(i + n) % arr.length]
end

puts rotated.inspect
# => [3, 4, 5, 1, 2]


=begin
Find common elements between two arrays
a = [1, 2, 3, 4]
b = [3, 4, 5, 6]
# Expected: [3, 4]
=end

# Solution 1: Using Set Intersection (&)
a = [1, 2, 3, 4]
b = [3, 4, 5, 6]

common = a & b
puts common.inspect
# => [3, 4]

# Solution 2: Using select and include?
a = [1, 2, 3, 4]
b = [3, 4, 5, 6]

common = a.select { |x| b.include?(x) }
puts common.inspect
# => [3, 4]

# Solution 3: Using Set for Performance (Large arrays)
# Set#include? is O(1), much faster for large arrays than Array#include?, which is O(n).
require 'set'

a = [1, 2, 3, 4]
b = [3, 4, 5, 6]

set_b = Set.new(b)
common = a.select { |x| set_b.include?(x) }
puts common.inspect
# => [3, 4]
