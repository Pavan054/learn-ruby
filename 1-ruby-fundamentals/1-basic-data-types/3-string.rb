# Sequence of characters.

first_name = "pavan kumar"

second_name = 'andavarapu'

puts first_name

puts second_name

puts "first_name.class"
puts first_name.class

puts "first_name.class.class"
puts first_name.class.class

puts "first_name.class.class.class"
puts first_name.class.class.class

puts "first_name.class.class.class.class"
puts first_name.class.class.class.class

# Interpolation

puts "Hello #{first_name} #{second_name}"

# Multi-line

puts <<~TEXT
  This is a
  multi-line string
TEXT

# Interview tip: String mutability matters: "abc".upcase returns new string, "abc".upcase! modifies in place.
