### Abstract Classes

# Ruby doesn’t have true abstract classes like Java.
# But you can simulate them by:
#   - Creating a base class
#   - Raising NotImplementedError for methods that must be overridden.

class Shape
  def area
    raise NotImplementedError, "Subclasses must implement area"
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
  end

  def area
    3.14 * @radius * @radius
  end
end

puts Circle.new(5).area   # => 78.5

## Interview Tip:
# If asked “Does Ruby support abstract classes?” → No, but you can mimic them with NotImplementedError.