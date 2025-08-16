### Closures

# A closure = function + environment (outer variables it remembers).
# Procs and Lambdas are closures.

def multiplier(factor)
  ->(x) { x * factor }
end

double = multiplier(2)
puts double.call(5)   # => 10

## Interesting:
# Even after multiplier returns, the lambda remembers factor.
# Very powerful for building functional-style helpers.
