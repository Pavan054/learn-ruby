# Key-value pairs (unordered in older Ruby versions, ordered in Ruby 1.9+).

person = { name: "Pavan", age: 28 }
puts person
puts person.class # => Hash
puts person.class.class # => Class

puts person[:name]  # => "Pavan"

# Keys can be strings, symbols, or even objects.

# Modern syntax: { key: value } is shorthand for { :key => value }.

mixed_hash = { symbol_one: :symbol, "string_one" => "string", 143 => 225 }
puts mixed_hash
mixed_hash.map {|i,j| p i.class }
