### Find Repeated Words

# We use backreference \1.

text = "This is is a test test sentence"
repeated = text.scan(/\b(\w+)\s+\1\b/i).flatten
puts repeated.inspect   # => ["is", "test"]

# Explanation:
#     -   (\w+) → capture a word.
#     -   \s+ → whitespace after it.
#     -   \1 → repeat of the same word.
#     -   \b → word boundaries (so "is" in "island" won’t count).