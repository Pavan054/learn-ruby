### Regular Expression Options

/abc/i    # case-insensitive
/abc/m    # multi-line mode (^ and $ match line boundaries)
/abc/x    # allow whitespace and comments in regex

regex = /hello/ix
puts "HELLO" =~ regex   # => 0