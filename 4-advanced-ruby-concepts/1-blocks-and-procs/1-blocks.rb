### Blocks

# A block is an anonymous piece of code between {} or do...end.
# Can be passed to methods, but not stored in a variable directly (unless converted to a Proc).
# Only one block can be passed to a method.

def greet
  puts "Before block"
  yield if block_given?
  puts "After block"
end

greet { puts "Hello from block!" }
# Output:
# Before block
# Hello from block!
# After block

## Interview Tip:
# yield executes the block.
# block_given? avoids errors if no block passed.