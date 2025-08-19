### Matching Patterns

puts /abc/ =~ "abcdef"        # => 0
puts /xyz/ =~ "abcdef"        # => nil
puts /^\d{3}$/ =~ "123"       # => 0 (matches exactly 3 digits)
puts /ruby/i =~ "RuBy"        # => 0 (case-insensitive with `i`)

=begin

^ → start of string

$ → end of string

\d → digit

. → any character except newline

*, +, ? → repetition quantifiers

=end