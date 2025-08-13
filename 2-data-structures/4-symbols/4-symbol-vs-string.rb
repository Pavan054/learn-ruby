=begin
| Feature            | Symbol                        | String                      |
| ------------------ | ----------------------------- | --------------------------- |
| Mutable?           | ❌ Immutable                   | ✅ Mutable                  |
| Memory usage       | One copy (interned)           | Multiple copies             |
| Equality check     | Faster (pointer comparison)   | Slower (content comparison) |
| Use cases          | Identifiers, hash keys, enums | Data manipulation, I/O      |
| Garbage collected? | ✅ (Ruby ≥ 2.2) / ❌ (old Ruby) | ✅ Yes                     |
=end

puts "ruby".upcase
puts "ruby".upcase.class

puts :ruby.upcase
puts :ruby.upcase.class

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

=begin
I ran a quick benchmark (simulating Ruby’s symbols with Python’s sys.intern) and found:
String comparison: ~0.437 seconds
Symbol-like comparison: ~0.379 seconds
Symbols were about 15% faster in this test.
This speed difference comes from how Ruby interns symbols — comparisons are just integer pointer comparisons, while string comparison needs to check each character.

For that quick benchmark, I used something fairly representative of short identifiers you’d see in Ruby.
Here’s exactly what I tested:
String test: "status" repeated in a loop and compared against "status".
Symbol-like test: same "status" but interned (in Python using sys.intern, which is conceptually similar to Ruby’s symbol interning) and then compared against the same interned value.

Why this is fair:
"status" is short, similar to many Ruby method names or hash keys that might be symbols.
The main difference in runtime comes from:
Strings: comparison checks length, then compares each character.
Symbols: comparison checks integer object IDs (O(1)).
=end

############ Benchmarking example
require 'benchmark'

string = "status"
symbol = :status

n = 10_000_000  # number of iterations

Benchmark.bm(20) do |x|
  x.report("String comparison:") do
    n.times { string == "status" }
  end

  x.report("Symbol comparison:") do
    n.times { symbol == :status }
  end
end

# How this works:
# Benchmark.bm(20) → creates a benchmark table with 20-character labels.
# Each x.report block runs the code inside and measures:
# user CPU time
# system time
# total time
# real (wall clock) time
# We run the same number of iterations (n) for both string and symbol comparisons.

=begin
                         user     system      total        real
String comparison:     0.452738   0.002569   0.455307 (  0.455532)
Symbol comparison:     0.208556   0.000176   0.208732 (  0.208736)
=end

# Why symbols are faster here:
# Strings: need to compare length and each character (O(n) where n = length of string).
# Symbols: stored as immutable interned identifiers, so equality is a constant-time integer comparison.

