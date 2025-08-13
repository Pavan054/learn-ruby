# Immutability of Symbols

# Symbols cannot be changed after creation.

puts :ruby.upcase           # RUBY
puts :ruby.upcase.class     # Symbol

# In general it should give "NoMethodError: undefined method `upcase' for :ruby:Symbol"

=begin
In Ruby 3.4.4, and it's behaving exactly as expected: the expression

puts :ruby.upcase       # => RUBY

prints RUBY, because Ruby does implement an upcase method on the Symbol class. 
What it does is convert the symbol to a string, upcase it, and then convert it back to a symbol (interned).

How the methods work
According to the Ruby documentation (for Symbol in version 3.1.1, and reliably presumed same in 3.4):

Symbol#upcase returns a new symbol that’s the uppercase version of the original.

Internally, it does something like:
sym.to_s.upcase.to_sym

In Ruby 2.4 and earlier, calling .upcase on a symbol (like :ruby.upcase) would raise:
NoMethodError: undefined method `upcase' for :ruby:Symbol

Symbols in Ruby have always been immutable, but they didn't have string-like methods (like .upcase, .downcase, .capitalize, etc.) until Ruby 2.5.

Symbol#upcase, Symbol#downcase, Symbol#capitalize, and Symbol#swapcase were added in Ruby 2.5.
=end