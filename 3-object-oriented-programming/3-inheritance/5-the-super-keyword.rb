### The super Keyword

# Calls the same method from the parent (superclass).
# Can pass arguments explicitly or implicitly.

class Person
  def initialize(name)
    @name = name
  end
end

class Student < Person
  def initialize(name, grade)
    super(name)   # call parent’s initialize
    @grade = grade
  end
end

s = Student.new("Alice", "A")
p s   # => #<Student:0x... @name="Alice", @grade="A">

## Interview Tip:
# super with no args → passes current method’s args.
# super() with empty parens → calls parent method with no args.