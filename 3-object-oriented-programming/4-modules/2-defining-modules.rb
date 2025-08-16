### Defining Modules

module MathHelpers
  PI = 3.14   # constant

  def self.square(x)   # module method
    x * x
  end
end

puts MathHelpers::PI          # => 3.14
puts MathHelpers.square(5)    # => 25

## Interesting: Constants inside modules are namespaced (no global pollution).