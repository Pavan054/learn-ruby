### How does return differ between lambda and proc?

def proc_return
  p = Proc.new { return "From Proc" }
  p.call
  "After Proc"
end

def lambda_return
  l = -> { return "From Lambda" }
  l.call
  "After Lambda"
end

puts proc_return    # => "From Proc"
puts lambda_return  # => "After Lambda"

# Proc: return exits the whole method (escapes immediately).
# Lambda: return exits only from the lambda, then execution continues in the method.

## Interview key line:
# “This is why lambdas are safer inside methods — they don’t hijack control flow like Procs.”
