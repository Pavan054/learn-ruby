sym1 = :ruby
puts sym1
puts sym1.class

sym2 = :"Ruby on Rails"   # Quoted if spaces or special characters
puts sym2
puts sym2.class

sym3 = "ruby".to_sym      # From string
puts sym3
puts sym3.class

sym4 = "ruby".intern      # Same as to_sym
puts sym4
puts sym4.class

# Note: Once created, a symbol stays in memory until the program ends 
# (in Ruby ≤ 2.2) or can be GC’d (Ruby ≥ 2.2 for dynamically created symbols).