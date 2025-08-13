h = Hash.new(0)
h[:apples] += 1
puts h               # => {:apples=>1}

# Or setting default with block
h = Hash.new { |hash, key| hash[key] = [] }
h[:fruits] << "apple"
h[:fruits] << "banana"
puts h               # => {:fruits=>["apple", "banana"]}

## Interview Insight: Hash.new([]) is wrong for mutable objects like arrays because all keys share the same object. 
## Always prefer the block syntax when assigning mutable defaults.

=begin
Interesting Stuff:

Hashes preserve insertion order since Ruby 1.9.
Symbols (:name) are faster and more memory-efficient than strings as keys.
Hashes are used heavily in Rails for params, options, etc.
Ruby 3 introduced pattern matching which can destructure hashes elegantly.
=end