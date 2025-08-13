arr = [10, 20, 30, 40]

p arr[0]        # => 10
p arr[-1]       # => 40 (last element)
p arr[1..2]     # => [20, 30]
p arr[0, 2]     # => [10, 20]

p arr.fetch(3, "default") # => 40
p arr.fetch(4, "default") # => "default"
# This is the default value that will be returned if the index is out of bounds

p arr
