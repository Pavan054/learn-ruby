### Use Lookaheads/Lookbehinds to Parse Structured Text

# Extract prices, but only the numeric part after $.
text = "Items: $20, €30, $100, INR200"
prices = text.scan(/(?<=\$)\d+/)
puts prices.inspect   # => ["20", "100"]

# Explanation:
#     -   (?<=\$) → positive lookbehind (must have $ before).
#     -   \d+ → capture digits.

# Find words followed by a colon (like in key-value text):
data = "Name: Pavan, Age: 30, Role: Developer"
keys = data.scan(/\b\w+(?=:)/)
puts keys.inspect   # => ["Name", "Age", "Role"]

# Explanation:
#   -   (?=:) → positive lookahead (check : exists ahead).