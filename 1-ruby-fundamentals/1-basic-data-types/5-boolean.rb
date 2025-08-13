# Only two values: true and false

# Interesting: In Ruby, only false and nil are falsy, everything else is truthy — even 0, "", and [].

active = true

puts active

puts "active.class"
puts active.class

puts "active.class.class"
puts active.class.class

alien = false

puts alien

puts "alien.class"
puts alien.class

puts "alien.class.class"
puts alien.class.class

relation = nil

puts relation

puts "relation.class"
puts relation.class

puts "relation.class.class"
puts relation.class.class

items = 0
puts "items - if" if items
puts "items - unless" unless items

append = ""
puts "append - if" if append
puts "append - unless" unless append

data = []
puts "data - if" if data
puts "data - unless" unless data
