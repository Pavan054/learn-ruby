## Class Variables

# Start with @@.
# Shared among all objects of the class.
# Can be dangerous if overused (shared mutable state).

class Car
  @@total_cars = 0

  def initialize
    @@total_cars += 1
  end

  def self.total_cars
    @@total_cars
  end
end

Car.new
Car.new
puts Car.total_cars  # 2

## Interview caution: Class variables are shared even with subclasses, which can cause unexpected side effects. 
## Class instance variables (@var at class level) are often safer.