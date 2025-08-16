### Procs as First-Class Objects

# A Proc (procedure) is an object representing a block.
# Unlike a block, Procs can be stored in variables, passed around, and reused.

double = Proc.new { |n| n * 2 }
puts double.call(5)   # => 10

## Interview Tip:
# Procs make blocks reusable.
# Blocks are syntactic sugar; Procs are objects.