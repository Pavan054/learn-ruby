### Lambda vs Proc

=begin
Both are callable objects

| Feature               | Proc                                           | Lambda                                 |
| --------------------- | ---------------------------------------------- | -------------------------------------- |
| **Argument handling** | Ignores wrong number of args (missing → `nil`) | Strict (raises error if args mismatch) |
| **Return behavior**   | Returns from the enclosing method              | Returns only from lambda itself        |
| **Creation**          | `Proc.new {}` or `proc {}`                     | `lambda {}` or `-> {}`                 |
=end

# Argument handling
p = Proc.new { |x, y| puts "x=#{x}, y=#{y}" }
p.call(1)    # => x=1, y=

l = -> (x, y) { puts "x=#{x}, y=#{y}" }
# l.call(1)    # => ArgumentError
l.call(1, 2)

# Return behavior
def test_proc
  p = Proc.new { return "From Proc" }
  p.call
  "After Proc"
end
puts test_proc   # => "From Proc"

def test_lambda
  l = -> { return "From Lambda" }
  l.call
  "After Lambda"
end
puts test_lambda # => "After Lambda"

## Lambda is closer to a method; Proc is closer to a block.