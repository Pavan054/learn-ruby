### Superclass and Subclass

class Vehicle
  def wheels; 4; end
end

class Bike < Vehicle
  def wheels; 2; end
end

v = Vehicle.new
b = Bike.new

puts v.wheels   # => 4
puts b.wheels   # => 2

# Vehicle → superclass
# Bike → subclass