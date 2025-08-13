# each

puts "each"

[1, 2, 3].each do |n|
  puts n
end

# map – transforms and returns a new array

puts "map"

squares = [1, 2, 3, 4, 5].map { |i| i * i }
p squares

# select – filters elements

puts "select"

elements = [1, 2, 3, 4, 5].select { |i| i < 4 }
p elements

elements = [1, 2, 3, 4, 5].select { |i| i.odd? }
p elements

## Interesting: Iterators are part of Ruby's Enumerable module, giving access to rich methods like reduce, find, all?, any?, etc.

## Interview Tip: Strong knowledge of iterators = cleaner, idiomatic code.


=begin

What is Enumerable in Ruby?

Enumerable is a module that provides dozens of powerful methods for collection-like classes (Array, Hash, Range, etc.).
To use Enumerable, a class must define an each method.
Once it does, you get access to methods like map, select, reduce, find, all?, any?, etc.

Why this matters in Interviews?

“Ruby’s Enumerable module promotes declarative programming—focusing on what you want, not how to iterate.”

=end

## let’s explore some key methods of Enumerable, with examples:

# each - Basic iterator that yields elements one by one.
p "each"
[1, 2, 3].each do |num|
  puts num
end

# map (aka collect) - Transforms every element in the collection.
p "map"
plus_five = (1..5).map { |n| n + 5 }
p plus_five

p "collect"
plus_five = (1..5).map { |n| n + 5 }
p plus_five

# select (aka filter) - Returns elements for which the block returns true.
p "select"
evens = (1..6).select { |n| n.even? }
p evens

p "filter"
evens = (1..6).filter { |n| n.even? }
p evens

# reject - Opposite of select.
p "reject"
rejected_elements = (1..10).reject { |n| n.even? }
p rejected_elements

# find (aka detect) - Returns first matching element.
p "find"
find_one = (1..5).find { |n| n > 3 }
p find_one

p "detect"
detect_one = (1..5).detect { |n| n > 3 }
p detect_one

# reduce (aka inject) - Performs accumulation across elements.
p "reduce"
p (1..4).reduce(0) { |sum, n| sum + n }

p (1..4).sum # alternative

p "inject"
p [1, 2, 3, 4].inject(0) { |sum, n| sum + n }

# all? - Returns true if all elements match condition.
p "all?"
p [2, 4, 6].all?(&:even?)
p [1, 3, 5].all?(&:odd?)

# any? - Returns true if any element matches.
p "any?"
p [1, 3, 4].any?(&:even?)
p [2, 4, 7].any?(&:odd?)

# none? - Returns true if no element matches.
p "none?"
p [1, 3, 5].none?(&:even?)
p [2, 4, 6].none?(&:odd?)

# count - Counts matching elements (or total if no block).
p "count"
p [1, 2, 3, 4, 5].count
p [1, 2, 3, 4, 5].count(&:even?)
p [1, 2, 3, 4, 5].count(&:odd?)

### Custom Class with Enumerable
### Let’s say you’re asked in an interview: "How does a class support Enumerable?"

class Team
  include Enumerable

  def initialize(players)
    @players = players
  end

  def each
    @players.each { |p| yield p }
  end
end

team = Team.new(["Pavan", "Deepika", "Jhanvi"])

team.each { |name| puts name }           # Works!
puts team.map { |name| name.upcase }     # => ["PAVAN", "DEEPIKA", "JHANVI"]

# Because the class defines each, and includes Enumerable, it gets all those methods (map, select, reduce, etc.) for free.

## Interview Takeaway
## “Any class that defines 'each' and includes 'Enumerable' gains over 50+ useful methods to make iteration expressive, clean, and Ruby-idiomatic.”