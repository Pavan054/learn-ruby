### Alias Method

# Create a new name for an existing method.

class Hello
  def greet
    "Hello!"
  end
  alias welcome greet
end

puts Hello.new.welcome  # "Hello!"

## Tip: Aliases keep the original method’s functionality.