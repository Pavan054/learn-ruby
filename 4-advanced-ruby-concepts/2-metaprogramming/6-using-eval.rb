### Using eval

# eval runs a string as Ruby code.
# Powerful, but dangerous (security risk).

code = "3 + 5 * 2"
puts eval(code)   # => 13

## Interview Tip: 
# Always mention that eval should be avoided in production due to code injection risks. 
# Instead use send, define_method, or reflection.