## An Array is an ordered, integer-indexed collection that can hold objects of any type — numbers, strings, or even other arrays.

arr = [1, "Pavan Kumar", 4.5, :one, true]
p arr[3]

## Creating Arrays
# Empty array
a = []
p a

# With values
b = [1, 2, 3]
p b

# Using %w for string arrays
fruits = %w[apple banana cherry]  # => ["apple", "banana", "cherry"]
p fruits

# Using Array.new
c = Array.new(3)         # => [nil, nil, nil]
p c
d = Array.new(3, 0)      # => [0, 0, 0]
p d

### Interview tip: %w[] is used to create array of strings without quotes and commas.