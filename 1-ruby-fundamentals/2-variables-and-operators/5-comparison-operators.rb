=begin
| Operator | Meaning          | Example   | Result                             |
| -------- | ---------------- | --------- | ---------------------------------- |
| `==`     | Equal            | `5 == 5`  | `true`                             |
| `!=`     | Not equal        | `3 != 5`  | `true`                             |
| `>`      | Greater than     | `5 > 2`   | `true`                             |
| `<`      | Less than        | `2 < 5`   | `true`                             |
| `>=`     | Greater or equal | `5 >= 5`  | `true`                             |
| `<=`     | Less or equal    | `4 <= 5`  | `true`                             |
| `<=>`    | Spaceship        | `a <=> b` | `-1, 0, 1` depending on comparison |
=end

## Interesting:
# <=> is used in sorting and custom comparisons.

=begin
| Expression             | Result |
| ---------------------- | ------ |
| `a <=> b` and `a < b`  | `-1`   |
| `a <=> b` and `a == b` | `0`    |
| `a <=> b` and `a > b`  | `1`    |
=end

##################################################################
## Sorting Numbers Descending
numbers = [3, 7, 1, 5]

sorted = numbers.sort { |a, b| b <=> a }
p sorted  # => [7, 5, 3, 1]

##################################################################
## Sorting Numbers Ascending
sorted = numbers.sort { |a, b| a <=> b }
p sorted  # => [1, 3, 5, 7]

##################################################################
## Custom Sorting with Objects
## Example: Sort User objects by age, then by name
class User
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  # This defines how a User object looks when printed with puts.
  def to_s
    "#{name} (#{age})"
  end

  # Spaceship operator for sorting
  def <=>(other)
    age_cmp = age <=> other.age
    return age_cmp unless age_cmp == 0

    name <=> other.name  # secondary sort by name
  end
#   Let’s break this part down:
#   age <=> other.age: compares ages (returns -1, 0, 1)
#   return age_cmp unless age_cmp == 0: if ages are different, return the result
#   If ages are equal, it falls back to comparing names alphabetically

#   This is multi-level sorting:
#   Primary: age (ascending)
#   Secondary: name (alphabetical)
end

# Include Comparable module to use sort, max, etc.
class User
  include Comparable
#   This module gives you:
#   >, <, >=, <=, between?, sort, etc.
#   But it only works if you define <=>.
end

users = [
  User.new("Alice", 30),
  User.new("Bob", 25),
  User.new("Charlie", 30),
  User.new("David", 25)
]

puts users.sort
# Output:
# Bob (25)
# David (25)
# Alice (30)
# Charlie (30)

##################################################################
## Using Comparable Without Sort
u1 = User.new("Alice", 30)
u2 = User.new("Bob", 25)

puts u1 > u2   # => true (since 30 > 25)
# This works only if you include the Comparable module and define <=>.

=begin
Interview Tip:
"The <=> operator is used internally by Ruby’s sort, min, max, and more. When you include the Comparable module and define <=>, you get all these methods for free."
=end

