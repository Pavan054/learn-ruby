### Method Overriding

# If a subclass defines a method with the same name as the superclass, it overrides it.

class Animal
  def sound
    "Generic sound"
  end
end

class Cat < Animal
  def sound
    "Meow"
  end
end

puts Cat.new.sound   # => "Meow"
