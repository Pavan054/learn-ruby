### Mixins

# Modules provide reusable methods that can be mixed into classes.

module Swimmable
  def swim; "I can swim!"; end
end

class Dog
  include Swimmable
end

puts Dog.new.swim   # => "I can swim!"

## Interesting Fact: Ruby’s standard library uses modules extensively (Enumerable, Comparable, etc).

## Interview Tip:
# Use inheritance for "is-a".
# Use mixins (modules) for "can-do".