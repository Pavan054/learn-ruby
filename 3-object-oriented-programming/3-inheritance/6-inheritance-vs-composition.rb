### Inheritance vs Composition

## Inheritance:

# "Is-a" relationship.
# Example: Dog is an Animal.

class Animal; end
class Dog < Animal; end

## Composition:

# "Has-a" relationship.
# Example: Car has an Engine.

class Engine
  def start; "Engine started"; end
end

class Car
  def initialize
    @engine = Engine.new
  end

  def drive
    @engine.start + " → Car is moving"
  end
end

puts Car.new.drive
# => "Engine started → Car is moving"

## Interview Tip:
# When asked “Which is better: inheritance or composition?” →
# Inheritance → when subclass is a specialized version of parent.
# Composition → when you want flexibility, avoid tight coupling, and don’t need an "is-a" relationship.