### Conditional Statements
=begin
Exercise: Grade Evaluator
Write a program that takes a number (0–100) and prints:

"Distinction" if score > 75

"Pass" if score between 40–75

"Fail" otherwise

Use if, elsif, else
=end

score = 50

if score > 75
    puts "Distinction"
elsif score > 40
    puts "Pass"
else
    puts "Fail"
end

### Case Statements
=begin
Exercise: Simple Calculator
Write a method that accepts three parameters: num1, num2, and operation.
operation can be: add, subtract, multiply, divide.

Use case to perform the correct operation and return the result.

calculate(10, 5, "multiply") # => 50
=end

def calculate(num1, num2, operation)
    case operation
    when "add"
        p num1 + num2
    when "subtract"
        p num1 - num2
    when "multiply"
        p num1 * num2
    when "division"
        p num1 / num2
    else
        p 'unknown operation'
    end
end

calculate(2, 3, "multiply")

### Loops (while, until, for)
=begin
Exercise: Print even numbers till 20
Use:
while loop
until loop
for loop
=end

# while loop
i = 2
while i <= 20
    puts i if i%2==0
    i+=1
end

# until loop
i = 2
until i > 20
    puts i if i%2==0
    i+=1
end

# for loop
for i in 1..20
    puts i if i%2==0
    i+=1
end

### Iterators: each, map, select
=begin
Given this array:

names = ["alice", "bob", "charlie"]

Capitalize each name using 'map'
Print only names longer than 3 characters using 'select'
Print each name with a greeting using 'each'
=end

names = ["alice", "bob", "charlie"]

# Capitalize each name using 'map'
p names.map { |name| name.capitalize }

# Print only names longer than 3 characters using 'select'
p names.select { |name| name.size > 3 }

# Print each name with a greeting using 'each'
names.each do |name|
    puts "Hello #{name}"
end

### Break and Next Statements
=begin
Exercise: Find first number divisible by 7 in array

numbers = [3, 9, 12, 20, 28, 35]

Use 'each'
Use 'break' to stop when you find it
Use 'next' to skip odd numbers while printing
=end

numbers = [3, 9, 12, 20, 28, 35]

found = nil

numbers.each do |num|
  next if num.odd?              # Skip odd numbers
  if num % 7 == 0
    found = num
    break                       # Stop loop when found
  end
end

p found

### Exception Handling
=begin
Exercise: Divide with error handling
Ask user for two numbers, divide them, and handle:
ZeroDivisionError (if denominator is 0)
ArgumentError or general error (non-numeric input)
Always print "Operation attempted" in ensure.
=end

begin
  print "Enter numerator: "
  num1 = Integer(gets.chomp)

  print "Enter denominator: "
  num2 = Integer(gets.chomp)

  result = num1 / num2
  puts "Result: #{result}"

rescue ZeroDivisionError
  puts "Error: Cannot divide by zero."

rescue ArgumentError
  puts "Error: Please enter valid numbers."

rescue StandardError => e
  puts "Error: #{e.message}"

ensure
  puts "Operation attempted"
end
