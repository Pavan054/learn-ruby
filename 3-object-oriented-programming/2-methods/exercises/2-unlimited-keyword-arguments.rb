### Method that Accepts Unlimited Keyword Arguments but Requires One Specific One

# Ruby 2.1+ lets you require specific keyword arguments, even if you also allow others.

def greet_user(required:, **kwargs)
  puts "Hello, #{required}!"
  puts "Extra info: #{kwargs.inspect}" unless kwargs.empty?
end

greet_user(required: "Pavan", city: "Hyderabad", age: 30)
# Output:
# Hello, Pavan!
# Extra info: {:city=>"Hyderabad", :age=>30}

# greet_user(city: "Hyderabad")
# => ArgumentError: missing keyword: :required

=begin
Key Interview Points:
    - required: makes that keyword mandatory.
    -  **kwargs still collects other optional keywords.
    - This is different from optional keywords with default values.
=end