### Extending Modules

# extend → adds module methods as class methods.

module Loggable
  def log(msg)
    "[LOG] #{msg}"
  end
end

class App
  extend Loggable
end

puts App.log("Started")   # => [LOG] Started

## Interview Tip:
#   - include → instance scope
#   - extend → class scope