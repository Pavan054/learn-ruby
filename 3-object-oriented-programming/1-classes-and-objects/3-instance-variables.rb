## Instance Variables

# Belong to a specific object.
# Start with @.
# Separate for each object.

class Car
  def set_brand(brand)
    @brand = brand
  end

  def get_brand
    @brand
  end
end

car = Car.new
car.set_brand("Toyota")
puts car.get_brand  # "Toyota"

car2 = Car.new
puts car2.get_brand
puts car2.get_brand.class

## An uninitialized instance variable returns nil, not an error.