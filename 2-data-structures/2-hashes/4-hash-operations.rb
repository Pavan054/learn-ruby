# Merging two hashes
a = { x: 1, y: 2 }
b = { y: 3, z: 4 }
p merged = a.merge(b)  # => {:x=>1, :y=>3, :z=>4}

# select
person = { name: "Pavan Kumar", age: 27, good: true, address: nil }
p selected = person.select { |k, v| v.is_a?(String) }

# reject
p rejected = person.reject { |k, v| v.nil? }
