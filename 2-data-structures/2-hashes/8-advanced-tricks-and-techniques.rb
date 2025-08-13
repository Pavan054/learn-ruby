#### Default with Block for Nested Hashes

nested = Hash.new { |h, k| h[k] = Hash.new(0) }
p nested
nested[:fruits][:apple] = 1
nested[:fruits][:orange] = 1
p nested
nested[:vegetables][:carrot] = 1
nested[:vegetables][:potato] = 1
p nested

#### Use transform_keys and transform_values
h = { "a" => 1, "b" => 2, "c" => 3 }

p h.transform_keys(&:to_sym)
p h.transform_values { |v| v*3 }

#### Convert flat hash to nested hash
# Input:
# {"user.name" => "Alice", "user.age" => 30}
# Output:
# {user: {name: "Alice", age: 30}}

input = {"user.name" => "Alice", "user.age" => 30}
nested = {}

input.each do |key, value|
    keys = key.split(".")
    nested[keys[0].to_sym] ||= {}
    nested[keys[0].to_sym][keys[1].to_sym] = value
end

p nested

#### Use Hash for Memoization (in recursion)
# Fibonacci with memoization using hash
def fib(n, memo = {})
  return n if n < 2
  memo[n] ||= fib(n-1, memo) + fib(n-2, memo)
end

puts fib(10) # => 55

#### Digging into deeply nested hashes
data = { user: { profile: { name: "Alice" } } }

# Avoid errors if key missing
puts data.dig(:user, :profile, :name)     # => "Alice"
puts data.dig(:user, :profile, :email)    # => nil
