### Why can you pass only one block to a method?

# - Ruby’s method call syntax supports only one implicit block parameter.
# - Blocks are not objects (unlike Procs/Lambdas).
# - Internally, Ruby methods receive the block as a hidden argument (like &block), so only one block slot exists.

# Workaround: You can pass multiple Procs/Lambdas as arguments, since they are objects.

def operate(a, b, proc1, proc2)
  puts proc1.call(a, b)
  puts proc2.call(a, b)
end

add = ->(x, y) { x + y }
mul = ->(x, y) { x * y }

operate(2, 3, add, mul)  # => 5, 6
