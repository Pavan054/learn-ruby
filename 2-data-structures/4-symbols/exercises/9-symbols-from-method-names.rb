## Symbols from Method Names

# Challenge:
# List all instance method names as symbols for the String class that start with "to_".

# Example Output (partial):
# [:to_s, :to_sym, :to_i, :to_f]

puts String.instance_methods.grep(/^to_/).inspect

# Explanation
#     String.instance_methods → gets all instance method names for String (including inherited ones).
#     .grep(/^to_/) → filters methods whose names start with "to_".
#     The result is already in symbol form.

# Time Complexity
#     O(m) where m is the total number of instance methods in String (small constant in practice).
# Space Complexity
#     O(k) where k is the number of matching methods (output list size).

# If you want only methods defined directly on String and not inherited ones, you can do:
puts String.instance_methods(false).grep(/^to_/).inspect