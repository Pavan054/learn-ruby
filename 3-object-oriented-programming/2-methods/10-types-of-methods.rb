##### Types of methods

### Instance methods

# Defined inside a class.
# Work on a specific object (instance).
# Can access instance variables (@var).

class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hello, I am #{@name}"
  end
end

p1 = Person.new("Alice")
puts p1.greet   # "Hello, I am Alice"

## each object gets its own copy of instance variables, and instance methods work on them.

###########################################################################################################################

### Class methods

# Defined with self.method_name or inside class << self.
# Belong to the class itself, not instances.

class MathUtil
  def self.square(x)
    x * x
  end
end

puts MathUtil.square(5)   # 25

## Interview Tip:
# Use class methods for utility/helper functions.
# Expect a question: “Difference between class and instance methods?” → Instance works on an object; class works on the class.

###########################################################################################################################

### Singleton Methods
# A method defined only on one object, not shared with other instances.

str = "hello"

def str.shout
  upcase + "!!!"
end

puts str.shout     # "HELLO!!!"
# Another string won’t have this method:
# "world".shout → NoMethodError

## Interview Tip:
# Singleton methods are heavily used in metaprogramming (e.g., defining class methods dynamically).
# Many Ruby libraries use them internally.

###########################################################################################################################

### Module Methods

# Defined inside a module with self.method_name.
# Used for grouping utilities.

module Converter
  def self.kg_to_lb(kg)
    kg * 2.205
  end
end

puts Converter.kg_to_lb(10)   # 22.05

## Interview Tip:
# Modules can be mixed in as include (instance methods) or extend (class methods).
# Interviewer may ask: “How do you share code across classes without inheritance?” → Use modules.

###########################################################################################################################

### Private methods

# Can’t be called with an explicit receiver (obj.private_method fails).
# Used for internal logic.

class Bank
  def initialize(balance)
    @balance = balance
  end

  def withdraw(amount)
    if valid_transaction?(amount)
      @balance -= amount
    end
  end

  private

  def valid_transaction?(amount)
    amount > 0 && amount <= @balance
  end
end

## Interview Tip:
# Interviewers love asking: “Can a private method be called with self?” → No, it can only be called implicitly.

###########################################################################################################################

### Protected methods

# Can be called with an explicit receiver, but only inside the same class or subclasses.

class Employee
  def initialize(salary)
    @salary = salary
  end

  def compare_salary(other)
    salary > other.salary
  end

  protected
  def salary
    @salary
  end
end

e1 = Employee.new(5000)
e2 = Employee.new(4000)

puts e1.compare_salary(e2)   # true

## Interview Tip:
# Interviewers often ask: “Difference between private and protected?”
# Private: no explicit receiver.
# Protected: allows explicit receiver, but only among same-class or subclass objects.

###########################################################################################################################

### Aliased methods

# Create a new name for an existing method.

class Greeting
  def hello
    "Hi!"
  end

  alias greet hello
end

g = Greeting.new
puts g.greet   # "Hi!"

## Interview Tip:
# Often used when refactoring code or maintaining backward compatibility.

###########################################################################################################################

### Method chaining

# Methods return self (or another object) so you can chain calls.

class Builder
  def initialize
    @data = []
  end

  def add(item)
    @data << item
    self   # return self for chaining
  end

  def show
    @data
  end
end

b = Builder.new.add("A").add("B").add("C")
puts b.show.inspect   # ["A", "B", "C"]

class Builder
  def initialize
    @data = []
  end

  def add(item)
    @data << item
    self   # return self for chaining
  end

  def show
    @data
  end
end

b = Builder.new.add("A").add("B").add("C")
puts b.show.inspect   # ["A", "B", "C"]

## Interview Tip:
# Used heavily in Rails (ActiveRecord queries).
# If asked “How does Rails allow User.where(...).order(...).limit(...)?” → Method chaining.

###########################################################################################################################

### Method overriding

# A subclass can redefine a parent method.
# super can be used to call parent’s version.

class Animal
  def speak
    "Sound"
  end
end

class Dog < Animal
  def speak
    super + " Woof"
  end
end

puts Dog.new.speak   # "Sound Woof"

## Interview Tip:
# If they ask: “What happens if you override initialize?” → Use super to call parent’s initialize.

###########################################################################################################################

### Overloading (Simulated)

# Ruby doesn’t support method overloading (same method name with different signatures).
# Instead, you use **default args, *args, or kwargs.

class Calculator
  def add(*args)
    args.sum
  end
end

puts Calculator.new.add(2, 3)        # 5
puts Calculator.new.add(1, 2, 3, 4)  # 10

## Interview Tip:
# If asked “Does Ruby support method overloading like Java?” → Answer: No, but we simulate it using flexible arguments (*args, **kwargs).