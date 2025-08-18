### Code Generation

# Metaprogramming lets you generate repetitive code automatically.

# Example: dynamically creating math operations:
class Calculator
  [:add, :subtract, :multiply, :divide].each do |op|
    define_method(op) do |a, b|
      a.send(op == :add ? :+ : op == :subtract ? :- : op == :multiply ? :* : :/, b)
    end
  end
end

calc = Calculator.new
puts calc.add(5, 3)       # => 8
puts calc.multiply(5, 3)  # => 15

## Rails Example: When you declare has_many :orders, Rails generates methods like orders, orders<<, orders.build dynamically.