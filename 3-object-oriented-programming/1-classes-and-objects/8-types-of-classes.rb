### Regular (Concrete) Classes

# The most common kind — defines attributes and methods that can be instantiated directly.

class Car
  def drive
    "Vroom!"
  end
end

car = Car.new
puts car.drive  # "Vroom!"

##  Interview tip: Concrete classes can be instantiated directly, unlike abstract classes 
## (Ruby doesn’t have a keyword for “abstract”, but we can mimic it — see below).

###########################################################################################################################

### Abstract-like Classes

# Ruby doesn’t have native abstract classes (like Java), but you can simulate them by:
# Not instantiating them directly.
# Raising NotImplementedError in methods.

class Vehicle
  def start
    raise NotImplementedError, "Subclasses must define `start`"
  end
end

class Bike < Vehicle
end

bike = Bike.new
# puts bike.start         # => 'Vehicle#start': Subclasses must define `start` (NotImplementedError)

class Vehicle
  def start
    raise NotImplementedError, "Subclasses must define `start`"
  end
end

class Bike < Vehicle
  def start
    "Bike started!"
  end
end

bike = Bike.new
puts bike.start         # => Bike started!

## Interview tip:
## Mention that this is a convention in Ruby, not enforced by the language. 
## Abstract-like classes are usually used in Template Method pattern implementations.

###########################################################################################################################

### Singleton Classes

# Every Ruby object has its own hidden class (singleton class) for methods defined on that single object.

car = "Tesla"

def car.honk
  "Beep beep!"
end

puts car.honk         # "Beep beep!"
# Another string object won’t have this method

## Singleton classes power class methods — they are actually methods on the class’s singleton class.

###########################################################################################################################

### Nested Classes

# A class can be defined inside another class.
# Namespaced and scoped to the outer class.

class Garage
  class Tool
    def use
      "Using the tool"
    end
  end
end

tool = Garage::Tool.new
puts tool.use

## Interview tip: Nested classes help in namespacing and grouping related logic.

###########################################################################################################################

### Anonymous Classes

# Classes created without a name using Class.new.
# Useful for temporary or dynamic behavior.

MyClass = Class.new do
  def greet
    "Hello!"
  end
end

obj = MyClass.new
puts obj.greet

## Interview tip: Useful in metaprogramming and when you don’t want to pollute the global namespace.

###########################################################################################################################

### Metaclasses

# A class whose instances are themselves classes.
# In Ruby, all classes are instances of Class.

puts String.class      # Class
puts Class.class       # Class

## Interview tip: The fact that Class is an instance of itself often surprises candidates — shows Ruby’s object model depth.

###########################################################################################################################

### Open Classes

# You can reopen existing classes and add/change methods at any time.

class String
  def shout
    upcase + "!"
  end
end

puts "hello".shout  # "HELLO!"

## Interview caution: This is powerful but risky — changing core classes can cause unexpected behavior in large codebases.

###########################################################################################################################

### Immutable Classes

# Ruby doesn’t have a native “final” keyword, but you can freeze a class to prevent modifications.

class MyFrozenClass
  def greet
    "Hi"
  end
end

MyFrozenClass.freeze
# MyFrozenClass.new_method   # => RuntimeError

## Interview tip: Mention that freezing prevents adding/removing methods or constants, but doesn’t make instances immutable.

###########################################################################################################################