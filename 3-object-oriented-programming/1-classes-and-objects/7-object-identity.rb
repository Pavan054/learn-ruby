## Object Identity

# Each object has a unique object_id.
# Two objects with same value can still be different (equal? checks identity).

a = "hello"
b = "hello"
puts a == b         # true (value equality)
puts a.equal?(b)    # false (different objects)
puts a.object_id
puts b.object_id

## Extra insight: Symbols and integers with the same value will always have the same object_id 
## because they are immutable and stored internally.