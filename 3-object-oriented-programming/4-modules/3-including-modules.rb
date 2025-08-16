### Including Modules

# include → adds module methods as instance methods.

module Greetable
  def greet
    "Hello!"
  end
end

class Person
  include Greetable
end

puts Person.new.greet   # => "Hello!"

## Interview Tip:
#   - include → instance methods.
#   - You can include multiple modules in the same class.