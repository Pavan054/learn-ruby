# Ruby uses a simple syntax for variable assignment:

name = "Pavan Kumar"
age = 26

puts name
puts age

# Multiple assignment:

a, b = 1, 2   # a = 1, b = 2
puts a
puts b

x = "pavan"
y = "kumar"

puts x
puts y

x, y = y, x   # swap values

puts x
puts y

## Interesting:
# You can assign parallel arrays easily.
# Unused variables can be ignored using _:

_, second = [3, 6, 9]

puts second
puts _

_, second, last = [3, 6, 9]

puts second
puts _
puts last