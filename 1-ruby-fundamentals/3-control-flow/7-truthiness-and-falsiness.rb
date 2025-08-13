=begin
In Ruby, everything is truthy except:
false
nil
=end

puts !!0       # => true
puts !!""      # => true
puts !![]      # => true
puts !!nil     # => false
puts !!false   # => false

## Interview Tip: This is different from some other languages where 0, "", or [] are falsy.