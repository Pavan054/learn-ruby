# Ordered, index-based collection.

laptop_brands = ["apple", "hp", "lenovo", "asus"]

p laptop_brands
puts laptop_brands

puts laptop_brands.class

puts laptop_brands.class.class

puts laptop_brands[0]
puts laptop_brands[0].class
puts laptop_brands[0].class.class

# Supports many methods: map, select, each, sort, etc.

# Can store mixed data types.

mixed_array = [1, "pavan kumar", 25.5, true, :active]
mixed_array.map {|i| p i.class}