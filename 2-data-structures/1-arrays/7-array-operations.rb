a = [1, 2, 3]
b = [3, 4, 5]

p a + b       # => [1, 2, 3, 3, 4, 5] (concatenation)
p a - b       # => [1, 2]
p b - a       # => [4, 5]
p a & b       # => [3] (intersection)
p a | b       # => [1, 2, 3, 4, 5] (union)

### Set-like behavior using arrays with & and | is great for comparing lists.

### Splat Operator *
# Splat is useful for variable arguments or flattening arrays.

args = [1, 2, 3]
puts *args   # same as puts 1, 2, 3

def greet(*names)
  names.each { |n| puts "Hi #{n}" }
end

greet("Alice", "Bob")
