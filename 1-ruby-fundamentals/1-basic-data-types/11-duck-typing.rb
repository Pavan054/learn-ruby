# Ruby checks if an object responds to a method, not its class.

# Interview tip: This is core to Ruby’s dynamic and flexible design.

def print_length(obj)
  puts obj.length if obj.respond_to?(:length)
end

print_length("hello")     # => 5
print_length([1, 2, 3])   # => 3
