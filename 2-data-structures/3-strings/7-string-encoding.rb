## Ruby strings have encoding metadata.

str = "hello"
p str.encoding       # => #<Encoding:UTF-8>

# Change encoding
p str.encode!("UTF-16")

p str.force_encoding("ASCII")

## Interview fact: Ruby 2.0+ uses UTF-8 by default, so it handles emojis and non-English chars naturally.
## Ruby uses UTF-8 by default (since 2.0), but encoding awareness is key when handling files or APIs.