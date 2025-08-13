a = [1, 2]

p a.push(3)         # => [1, 2, 3]
p a << 4            # => [1, 2, 3, 4]
p a.unshift(0)      # => [0, 1, 2, 3, 4]
p a.insert(2, 99)     # => [0, 1, 99, 2, 3, 4]

p a.pop             # => 4 (removes last)
p a.shift           # => 0 (removes first)
p a.delete(2)       # removes all occurrences of 2
p a                 # => [1, 99, 3]
p a.delete_at(2)    # Deletes at index 2
p a                 # => [1, 99]

## Interesting: push and << are similar. << is often preferred for readability and performance in Ruby.