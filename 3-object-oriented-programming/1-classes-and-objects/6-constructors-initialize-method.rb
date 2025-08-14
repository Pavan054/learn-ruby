## Constructors (initialize method)

# Called automatically when new is called.
# Used to set up initial state.

class Car
    def initialize(brand, color)
        @brand = brand
        @color = color
    end
end

tesla = Car.new("Tesla", "Red")
puts tesla.inspect

## Interview tip: 
## Ruby does not support multiple constructors, but you can simulate them with default arguments or class factory methods.