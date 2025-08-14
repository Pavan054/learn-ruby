### Method Arguments

## Positional Arguments
def add(a, b)
  a + b
end
puts add(2, 3)  # 5

## Default Arguments
def greet(name = "Guest")
  "Hello, #{name}!"
end
puts greet       # "Hello, Guest!"

## Keyword Arguments
def order(item:, qty:)
  "#{qty} #{item}(s) ordered."
end
puts order(item: "Apple", qty: 5)

## Splat Arguments (*args)
def sum(*nums)
  nums.sum
end
puts sum(1, 2, 3, 4)  # 10

## Double Splat Arguments (**kwargs)
# Introduced in Ruby 2.0, refined in 2.7.
# **kwargs collects extra keyword arguments into a hash.
def details(**info)
  info
end
puts details(name: "Pavan", age: 30)
## Interview tips:
# Ruby 2.7+ made keyword arguments fully separated from positional arguments — no more auto-conversion of hashes to kwargs unless explicitly using **.
# In Ruby 3+, forgetting ** in certain cases will raise ArgumentError.
