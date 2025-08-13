### Mutable vs Frozen Strings
p "abc".frozen? # → false
p 'abc'.freeze.frozen? # → true

# Ruby 3 can use frozen string literals with # frozen_string_literal: true at the top of a file (saves memory).

### String vs Symbol Performance
# Symbols (:name) are immutable and reused — better for keys and constants.
# Strings are mutable and not automatically reused unless frozen.

### Heredoc with interpolation & indentation
# <<~TEXT removes leading whitespace.
# <<~ is great for clean multi-line strings in code.

### String as Enumerable
# You can iterate over characters:
"Ruby".each_char { |ch| puts ch }
