## Symbol Method Invocation

# Challenge:
# Create a method that takes:
# An object
# A symbol representing a method name
# An array of arguments

# Then calls the method on the object dynamically.
# Example:
# call_method("hello", :gsub, [/l/, "x"])  
# Output: "hexxo"

# 1
def call_method(obj, method_sym, args = [])
  obj.public_send(method_sym, *args)
end

# Example
puts call_method("hello", :gsub, [/l/, "x"])
# => "hexxo"

# Why public_send?
# send can call private methods (could be unsafe in untrusted input scenarios).
# public_send restricts invocation to public methods only.
# This is preferred in interview questions when demonstrating safe dynamic method calls.

# Complexity Analysis

# Time Complexity:
# public_send → O(1) for method lookup (average), plus the cost of the invoked method itself.
# In the example, gsub is O(m) where m = string length.
# Overall: O(1 + invoked_method_cost).

# Space Complexity:
# O(1) additional — no unnecessary intermediate data structures.
# Only arguments and the return value occupy space.

# 2
def safe_call_method(obj, method_sym, args = [])
  # Check if the object responds to the method
  unless obj.respond_to?(method_sym, true)
    raise NoMethodError, "Undefined method '#{method_sym}' for #{obj.inspect}"
  end

  # Get method object to inspect parameters
  method_obj = obj.method(method_sym)
  arity = method_obj.arity

  # Check argument count
  if arity >= 0 && args.size != arity
    raise ArgumentError, "Wrong number of arguments (given #{args.size}, expected #{arity})"
  elsif arity < 0 && args.size < (arity.abs - 1)
    raise ArgumentError, "Wrong number of arguments (given #{args.size}, expected at least #{arity.abs - 1})"
  end

  # Call the method safely
  obj.public_send(method_sym, *args)
end

# Example
puts safe_call_method("hello", :gsub, [/l/, "x"]) # => "hexxo"

# Edge cases
# puts safe_call_method("hello", :fake_method, []) # => NoMethodError
# puts safe_call_method("hello", :gsub, [/l/])     # => ArgumentError

# Why This Is Good for Interviews
# Validation
#     - Checks if the method exists before calling it.
#     - Validates the argument count to avoid runtime surprises.
# Security
#     - Uses public_send to avoid calling private methods unless explicitly allowed.
# Error Messages
#     - Returns clear, informative error messages (better than Ruby’s generic ones).
# Edge Case Handling
#     - Works with methods of fixed and variable arity (negative arity means varargs in Ruby).

# Complexity
# Time Complexity:
#     - respond_to? → O(1)
#     - method lookup → O(1)
#     - Argument size check → O(1)
#     - Final method call → O(1 + cost_of_invoked_method)
# Space Complexity: O(1) extra.