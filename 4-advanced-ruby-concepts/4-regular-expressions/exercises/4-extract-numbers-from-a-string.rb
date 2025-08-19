### Extract Numbers from a String

text = "Order 123 costs 4567 rupees, delivered on 89th day"
numbers = text.scan(/\d+/).map(&:to_i)
puts numbers.inspect   # => [123, 4567, 89]

# Explanation:
#     -   \d+ → one or more digits.
#     -   scan → finds all matches.
#     -   map(&:to_i) → converts strings to integers.