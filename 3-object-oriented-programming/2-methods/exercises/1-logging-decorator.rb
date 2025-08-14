### Logging Decorator

# In Ruby, *args captures all positional arguments into an array, and **kwargs captures all keyword arguments into a hash.
# A logging decorator simply means: wrap a method so we can log the call before/after running it.

def log_decorator(method)
  define_method(method) do |*args, **kwargs, &block|
    puts "[LOG] Calling #{method} with args=#{args.inspect}, kwargs=#{kwargs.inspect}"
    result = super(*args, **kwargs, &block)  # Call the original method
    puts "[LOG] #{method} returned: #{result.inspect}"
    result
  end
end

class Calculator
  def add(a, b, round: false)
    sum = a + b
    round ? sum.round : sum
  end
end

class LoggingCalculator < Calculator
  log_decorator :add
end

calc = LoggingCalculator.new
calc.add(5.6, 2.2, round: true)

## Key Interview Points:
#   - *args collects variable positional arguments.
#   - **kwargs collects variable keyword arguments.
#   - super(*args, **kwargs) → forwards all arguments to the parent.
#   - You can use define_method dynamically to wrap methods.