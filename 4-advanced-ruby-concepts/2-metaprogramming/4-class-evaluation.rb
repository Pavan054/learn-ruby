### Class Evaluation

# Class Evaluation (class_eval and module_eval)
# class_eval: Evaluates code in the context of a class. Adds instance methods.
# module_eval: Same as class_eval but for modules.

class MyClass; end

MyClass.class_eval do
  def greet
    "Hello from instance method!"
  end
end

puts MyClass.new.greet   # => "Hello from instance method!"

# Rails Example: ActiveRecord uses class_eval to inject association methods (has_many :orders generates orders method inside your model)