### Method Overriding

# Inheritance allows subclasses to override parent methods.

class Parent
  def greet
    "Hello from Parent"
  end
end

class Child < Parent
  def greet
    "Hello from Child"
  end
end

puts Child.new.greet

## You can still call the parent’s version with super.

class Family < Parent
    def greet
        puts "Hello from Family"
        super
    end
end

puts Family.new.greet