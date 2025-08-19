### Capturing Groups

# Use (...) to capture parts of a match.

text = "Name: Pavan, Age: 30"
regex = /Name: (\w+), Age: (\d+)/

if text =~ regex
  puts $1   # => "Pavan"
  puts $2   # => "30"
end

# $1, $2, … store captured groups.
# Non-capturing groups: (?:...).