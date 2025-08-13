# Ruby 3 introduced pattern matching, which allows you to destructure hashes and other objects in a clean and 
# expressive way — similar to languages like Elixir, Scala, and even JavaScript (ES6+ destructuring).

## Basic Hash Destructuring
person = { name: "Pavan", age: 27 }

case person
in { name: n, age: a }
    puts "#{n}'s age is #{a}"
end

## Nested Hash Destructuring
user = {
  id: 1,
  profile: {
    username: "alice01",
    email: "alice@example.com"
  }
}

case user
in { profile: { username:, email: } }
  puts "Username: #{username}, Email: #{email}"
end

## Using if guard conditions
person = { name: "Pavan", age: 27 }

case person
in { name:, age: } if age >= 18
    puts "#{name} is an adult"
else
    puts "#{name} is a minor"
end

## Ignore Extra Keys in Hash
data = { name: "John", role: "admin", location: "NYC" }

case data
in { name:, ** }
  puts "Name found: #{name}"
end
# ** tells Ruby to match the rest of the hash but ignore it.

## Capturing Remaining Keys in a Variable
data = { name: "John", role: "admin", location: "NYC" }

case data
in { name:, **others }
    puts "#{name} with #{others}"
end
# If you wanted to capture the rest into a variable, you can do: **others

## destructure with array
case [1, 2, 3, 4]
in [1, *rest]
    p rest
end

## Match failure raises error (use if or case safely)
person = { name: "Pavan" }
case person
in { name:, age: }
    puts "name : #{name}"
else
    puts "incomplete data"
end

## Variable pinning (^)
# If you want to match against a specific value, use ^
status = { code: 200, message: "OK" }
expected_code = 200

case status
in { code: ^expected_code }
    puts "success"
else
    puts "fail"
end

## Array of Hashes + Pattern Matching
records = [
  { type: "event", id: 1 },
  { type: "error", id: 2 },
  { type: "event", id: 3 }
]

records.each do |record|
    case record
    in { type: "event", id: }
        puts "Event with ID #{id}"
    in { type: "error", id: }
        puts "Error with ID #{id}"
    end
end

=begin
Interview Insights:

This is very modern Ruby (good to mention in interviews).
Great for destructuring JSON-like data.
Works best in case statements, method parameter matching, and data processing.
Avoid using destructuring with non-standard key structures unless you're sure of the shape.
=end