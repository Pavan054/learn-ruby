### Method Overloading

# Ruby does not support method overloading like Java (same name, different parameters).

# Instead, you mimic it with default and variable arguments:

def greet(name = nil)
  if name
    "Hello, #{name}!"
  else
    "Hello!"
  end
end

## If you define the same method name again, the last definition overwrites the earlier one.