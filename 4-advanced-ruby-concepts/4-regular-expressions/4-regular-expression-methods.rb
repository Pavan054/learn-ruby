### Regular Expression Methods

puts "hello".match?(/he/)             # => true
puts "hello".match(/(h..)/)[1]        # => "hel"
puts "abc123".scan(/\d/)              # => ["1", "2", "3"]
puts "apple,banana".split(/,/)        # => ["apple", "banana"]
puts "hello".gsub(/[aeiou]/, "*")     # => "h*ll*"

=begin
match? → boolean check (faster, no MatchData).

match → returns MatchData.

scan → all matches.

split → split string.

gsub → replace globally.
=end