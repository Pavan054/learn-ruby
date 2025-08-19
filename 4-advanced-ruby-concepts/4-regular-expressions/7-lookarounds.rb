### Lookarounds

# Lookaheads and lookbehinds let you match context without consuming characters.

## Positive Lookahead (?=...)
puts /\d+(?= dollars)/.match("100 dollars") # => "100"


## Negative Lookahead (?!...)
puts /\d+(?! dollars)/.match("100 euros")   # => "100"


## Positive Lookbehind (?<=...)
puts /(?<=\$)\d+/.match("$200")  # => "200"


## Negative Lookbehind (?<!...)
puts /(?<!\$)\d+/.match("200")   # => "200"