### How are blocks closures in Ruby?

# A closure = function + environment it was defined in.
# Ruby blocks capture variables from their defining scope, not just execution scope.

def multiplier(factor)
  Proc.new { |x| x * factor }  # captures `factor`
end

double = multiplier(2)
puts double.call(5)  # => 10

# Even after multiplier has returned, the Proc remembers factor.
# This makes blocks powerful for stateful iteration, callbacks, DSLs (like in Rails).

## Interview one-liner:
# “Blocks in Ruby are closures because they capture and carry their surrounding scope along with them.”