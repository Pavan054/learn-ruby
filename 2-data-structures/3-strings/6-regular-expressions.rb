## Ruby’s Regexp is powerful and tightly integrated with strings.

str = "Email me at test@example.com"
match = str.match(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i)
puts match[0]  # "test@example.com"

## Common regex methods:
puts "abc125" =~ /\d+/          # returns 3 (match index)
puts"abc".match?(/a/)          # true
p "abc123".scan(/\d/)        # ["1", "2", "3"]
puts "abc123".gsub(/\d/, "#")   # "abc###"

str = "ruby 3.0"
p str.match?(/\d+\.\d+/)  # true
p str =~ /\d+/            # returns index 5
p str.scan(/\w+/)         # ["ruby", "3", "0"]
p str.gsub(/\d/, "#")     # "ruby #.#"

## Trick: scan gives all matches, match gives first match, gsub replaces all matches.