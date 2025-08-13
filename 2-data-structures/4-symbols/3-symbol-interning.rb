# Interning means Ruby stores only one copy of each unique symbol in memory.

# Multiple references point to the same object.


puts :ruby.object_id == :ruby.object_id  # true
puts "ruby".object_id == "ruby".object_id  # false

# Benefit: Faster comparisons (== is just pointer comparison).

# Downside: Older Ruby versions (before 2.2) could cause symbol memory leaks.