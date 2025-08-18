### Instance Evaluation

# instance_eval: Evaluates code in the context of a single object. Adds singleton methods (affects only that object).

str = "Hello"
str.instance_eval do
  def shout
    upcase + "!!!"
  end
end

puts str.shout          # => "HELLO!!!"
puts "World".respond_to?(:shout) # => false

# Used in DSLs (like config/routes.rb in Rails).