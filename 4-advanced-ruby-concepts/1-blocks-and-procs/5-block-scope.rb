### Block Scope

# Blocks inherit scope from where they are defined (closures).
# They can access outer variables, but block-local variables don’t leak outside.

x = 10
[1,2,3].each do |n|
  puts n + x  # => can access outer `x`
end

[1,2,3].each do |x|
  # block param `x` shadows outer `x`
  puts x
end
puts x   # => 10 (outer x unaffected)

## Interview Tip: This shows Ruby blocks are closures — they carry binding from outer scope.