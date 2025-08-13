# Immutable, reusable identifiers—used like lightweight strings for identifiers or keys.

# Symbols are faster and memory-efficient compared to strings when used repeatedly.

# Interned only once per symbol.

# Interview tip: Prefer symbols over strings for hash keys if values are not user-generated (e.g., from forms).

:status

person = {name: "pavan kumar", age: 25}

puts :status

puts ":status.class"
puts :status.class

puts ":status.class.class"
puts :status.class.class

puts person

puts "person.class"
puts person.class

puts "person.class.class"
puts person.class.class

puts person[:name]

puts "person[:name].class"
puts person[:name].class

puts "person[:age].class"
puts person[:age].class


########## Why Are Symbols Faster and More Memory-Efficient Than Strings?

## Immutability

# Symbols are immutable, while strings are mutable.

# Symbol: Once created, it cannot be changed.

# :hello.upcase!  # => NoMethodError

# String: Can be modified in place.

str = "hello"
puts str
str.upcase!     # => "HELLO"
puts str

# Because of immutability, Ruby doesn't need to track changes or allocate memory for different versions of a symbol.

## Internal Reuse (Symbol Interning)
# Ruby reuses the same symbol object every time it’s referenced.

puts :my_key.object_id
puts :my_key.object_id
puts (:my_key.object_id == :my_key.object_id)  # => true

# Whereas strings create a new object every time:

puts "my_key".object_id
puts "my_key".object_id
puts ("my_key".object_id == "my_key".object_id)  # => false

#This means:
# Every symbol exists only once in memory (interned).
# Strings must be allocated each time they're used unless explicitly frozen.

## Memory Efficiency

# Using symbols for repeated values (like keys in hashes) saves memory:

{ :name => "Pavan", :age => 30 }

# If you use strings instead:

{ "name" => "Pavan", "age" => 30 }

# Each "name" and "age" may be stored as separate objects if not reused properly, leading to more memory consumption.

## Performance in Hash Lookups

# Symbols are faster as hash keys because:
# Their object identity (object_id) is constant.
# Ruby can compare them using object IDs, not by evaluating characters.

:start == :start   # Fast → compares IDs
"start" == "start" # Slower → compares each character

puts (:start == :start)
puts ("start" == "start")

# This makes symbol-based hash lookups faster in many cases.

# But Be Careful: Symbols Are Not Garbage Collected (in older Ruby)
# Until Ruby 2.2, symbols were not garbage collected, which could cause memory leaks if dynamically created:

10000.times { |i| :"user_#{i}" }

# In Ruby 2.2+, dynamically-created symbols are garbage collected, but it's still recommended not to create excessive dynamic symbols.