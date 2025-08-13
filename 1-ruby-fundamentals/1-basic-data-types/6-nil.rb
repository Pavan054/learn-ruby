# Represents "nothing" or "no value".

nothing = nil

puts nothing

puts nothing.class # NilClass

puts nothing.class.class # Class

# Often used to indicate absence of value.

# Has methods like nil? and to_s.

puts nothing.nil? # true

puts nothing.to_i
puts nothing.to_i.class

puts nothing.to_s
puts nothing.to_s.class

puts nothing.to_s.to_i
puts nothing.to_s.to_i.class

puts nothing.to_i.to_s
puts nothing.to_i.to_s.class

# Interview tip: Use safe navigation operator:
# user&.name
