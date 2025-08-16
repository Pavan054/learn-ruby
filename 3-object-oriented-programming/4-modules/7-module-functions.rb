### Module Functions

# You can make module methods callable in two ways:
#     - As a module method (Math.sqrt)
#     - As a standalone function (when module_function is used)

module Utils
  def hello
    "Hello"
  end

  module_function :hello
end

puts Utils.hello         # => "Hello"
# puts Utils.new.hello     # => Error, not instantiable

# module_function makes methods both private instance methods and callable as module methods.
