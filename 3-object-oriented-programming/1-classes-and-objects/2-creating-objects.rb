## Creating Objects

# Use .new on the class.

class Car
end

car1 = Car.new
car2 = Car.new
puts car1.object_id  # Different from car2.object_id
puts car2.object_id

## Interview fact: new calls allocate (to reserve memory) then initialize (to set up state).