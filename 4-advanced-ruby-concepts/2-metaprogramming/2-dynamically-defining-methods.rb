### Dynamically Defining Methods

# You can create methods at runtime using define_method:

class Person
  [:first_name, :last_name, :email].each do |attr|
    define_method(attr) do |value=nil|
      if value
        instance_variable_set("@#{attr}", value)
      else
        instance_variable_get("@#{attr}")
      end
    end
  end
end

p = Person.new
p.first_name("Pavan")
puts p.first_name   # => "Pavan"

# Instead of manually writing 3 getters and setters, we generated them dynamically.

## Interview Tip: They might ask “How does Rails handle dynamic finders like find_by_email?” — this is done using method_missing or dynamic method generation.