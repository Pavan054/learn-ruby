### Inheritance

# Inheritance allows one class (subclass) to inherit behavior (methods, attributes) from another class (superclass).
# Helps in code reuse and creating hierarchical structures.

class Animal
  def speak
    "Some sound"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

puts Dog.new.speak   # => "Woof!"

## Interview Tip:
# Ruby supports single inheritance only (one superclass per class).
# For multiple inheritance, Ruby uses Modules / Mixins.
