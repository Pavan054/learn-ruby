## Class Methods

# Belong to the class, not an instance.
# Defined with self.method_name or def ClassName.method_name.

class Car
    def self.info
        "This calss is about Car"
    end
end

puts Car.info

## Fun fact: Class methods are really singleton methods on the class object.