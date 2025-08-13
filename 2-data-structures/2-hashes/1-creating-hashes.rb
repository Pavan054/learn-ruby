=begin

What is a Hash?

A Hash is a collection of key-value pairs.
Similar to dictionaries or maps in other languages.
Keys must be unique; values can be anything.

=end

## creating hashes and accessing values

person = { name: "Pavan Kumar", age: 27, good: true, address: nil }
p person
p person[:name]
p person[:age]
p person[:good]
p person[:address]
p person.delete(:address)
p person
p person.clear

empty_hash = Hash.new()
p empty_hash
empty_hash[:data] = "Some Data"
p empty_hash