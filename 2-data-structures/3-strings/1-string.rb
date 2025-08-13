## A string is an object representing a sequence of characters (letters, numbers, symbols, spaces).

## Mutable in Ruby: Unlike many languages (like Java), Ruby strings are mutable by default — you can change them in place.

str = "hello"
str << " world"
puts str   # "hello world"

## Interview tip: If you need immutable strings (to save memory or ensure safety), you can freeze them:

str.freeze