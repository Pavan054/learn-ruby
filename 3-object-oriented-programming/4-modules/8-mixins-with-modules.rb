### Mixins with Modules

# Mixins = injecting module methods into classes.
# Ruby’s way of achieving multiple inheritance.

module Walkable
  def walk
    "I can walk"
  end
end

module Swimmable
  def swim
    "I can swim"
  end
end

class Human
  include Walkable
  include Swimmable
end

puts Human.new.walk   # => I can walk
puts Human.new.swim   # => I can swim

## Interview Tip:
#   - Ruby does not support multiple inheritance.
#   - Instead, it uses Mixins (Modules).
#   - Very common in Rails (ActiveModel::Validations, Enumerable, Comparable).