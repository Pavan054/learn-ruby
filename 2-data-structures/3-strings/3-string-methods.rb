str = "  Ruby Programming  "
p str

##### Creation & Basic Info
p str.length      # 20
p str.size        # 20
p str.empty?      # false
p str.nil?        # false

##### Whitespace Handling
p str.strip       # "Ruby Programming"
p str.lstrip      # "Ruby Programming  "
p str.rstrip      # "  Ruby Programming"

##chomp
# Purpose: Removes the record separator (default: newline "\n") from the end of a string.
# Key point: It only removes the separator if it’s present at the end — not any random last character.
str1 = "Hello\n"
puts str1.chomp      # "Hello" → removes the newline
str2 = "Hello"
puts str2.chomp      # "Hello" → no newline, so unchanged
str3 = "Hello\r\n"
puts str3.chomp      # "Hello" → removes Windows-style newline
# Custom separator
str4 = "Hello World!!!"
puts str4.chomp("!!!")  # "Hello World"

## chop
# Purpose: Removes the last character of the string, regardless of what it is.
# Special case: If the string ends with "\r\n", both characters are removed.
str1 = "Hello"
puts str1.chop     # "Hell" → removes last character
str2 = "Hello\n"
puts str2.chop     # "Hello" → removes newline
str3 = "Hello\r\n"
puts str3.chop     # "Hello" → removes both \r and \n


##### Case Manipulation
str = "  Ruby Programming  "
puts str.upcase      # "  RUBY PROGRAMMING  "
puts str.downcase    # "  ruby programming  "
puts str.capitalize  # "  ruby programming  " (only first char)
puts str.swapcase    # "  rUBY pROGRAMMING  "

##### Substring & Access
str = "Ruby Programming"
p str[0]
p str[0, 5]
p str[-1]

## slice
# Extracts characters (or substrings) based on character positions.
# Works with character index, not byte index.
str = "Hello World"
puts str.slice(0)          # "H"  (first character)
puts str.slice(0, 5)       # "Hello"  (first 5 characters)
puts str.slice(6..10)      # "World"  (range from 6 to 10)
puts str.slice("World")    # "World"  (matches substring)
puts str.slice(/W\w+/)     # "World"  (matches regex)

## byteslice
# Extracts raw bytes from a string, based on byte index.
# Useful for binary data or when working with multi-byte encodings (like UTF-8).
# Indexes and lengths refer to bytes, not characters.
str = "Hello 🌍"  # globe emoji takes multiple bytes in UTF-8
p str
puts str.byteslice(0, 5)  # "Hello" (first 5 bytes)
puts str.byteslice(6, 4)  # "🌍"     (exact byte range for emoji)

##### Modification
## insert
str = "Hello World"
str.insert(5, ",")
puts str # Output: "Hello, World"

## << (Shovel operator)
str = "Hello"
str << " World"
puts str  # Output: "Hello World"

## concat
str = "Ruby"
str.concat(" Rocks")
puts str    # Output: "Ruby Rocks"

## replace
str = "Old string"
str.replace("New string")
puts str    # Output: "New string"

## clear
str = "Something"
str.clear
puts str.inspect    # Output: ""

##### Searching
## include?
str = "  Ruby Programming  "
p str.include?("Ruby") # true

## index
str = "I love Ruby and Ruby loves me"
p str.index("Ruby")         # 7 (first occurrence)

## rindex
str = "I love Ruby and Ruby loves me"
p str.rindex("Ruby")        # 16 (last occurrence)

## start_with?
p str.start_with?("  Ruby") # true

## end_eith?
p str.end_with?("ing  ")    # true

##### Substitution
## .sub/.gsub
# .sub
str = "one two two"
puts str.sub("two", "three")    # Output: "one three two"
puts str    # Output: "one two two"
# .gsub
str = "one two two"
puts str.gsub("two", "three")   # Output: "one three three"
puts str    # Output: "one two two"

## .sub!/.gsub!
# .sub!
str = "one two two"
puts str.sub!("two", "three")    # Output: "one three two"
puts str    # Output: "one three two"
# .gsub
str = "one two two"
puts str.gsub!("two", "three")   # Output: "one three three"
puts str    # Output: "one three three"

##### Splitting & Joining
## split
str = "apple,banana,cherry"
# Split by comma
p str.split(",")    # => ["apple", "banana", "cherry"]
# Split by space (default separator)
p "Hello World from Ruby".split     # => ["Hello", "World", "from", "Ruby"]
# Split with limit
p "a,b,c,d".split(",", 2)       # => ["a", "b,c,d"]

## chars - returns an array of characters
str = "Ruby"
p str.chars     # => ["R", "u", "b", "y"]

## each_char
str.each_char { |ch| puts ch }

## lines -> Splits the string into lines, based on newline characters.
str = "line1\nline2\nline3"
p str.lines # => ["line1\n", "line2\n", "line3"]
# .lines with chomp: true removes newlines
p str.lines(chomp: true)    # => ["line1", "line2", "line3"]

## each_line
# .each_line iterates over each line
str.each_line { |line| puts "Line: #{line}" }
# Output:
# Line: line1
# Line: line2
# Line: line3

##### Freezing
str = "Ruby"
str << " on Rails"
p str
str.freeze
# str << "!"      # can't modify frozen String: "Ruby on Rails"

##### Formatting & Interpolation
## Interpolation
# Only works with double quotes or %Q.
name = "Pavan"
age = 30
puts "My name is #{name} and I am #{age} years old."
# You can run Ruby code inside interpolation:
puts "2 + 2 = #{2 + 2}"  # "2 + 2 = 4"
# Interpolation inside single quotes won’t work.

## Formatting
# Ruby has sprintf and the % operator.
p sprintf("Name: %s, Age: %d", "Pavan", 30)
# => "Name: Pavan, Age: 30"
p "Name: %s, Age: %d" % ["Pavan", 30]
# => "Name: Pavan, Age: 30"
# Padding and precision
p "%05d" % 42        # "00042"
p "%.2f" % 3.14159   # "3.14"
p "%-10s %04d" % ["Ruby", 42]

##### Encoding & Binary
## Encoding
# Ruby strings have encoding metadata.
str = "hello"
p str.encoding       # => #<Encoding:UTF-8>
# Change encoding
p str.encode!("UTF-16")
p str.force_encoding("ASCII")
## Interview fact: Ruby 2.0+ uses UTF-8 by default, so it handles emojis and non-English chars naturally.
## Ruby uses UTF-8 by default (since 2.0), but encoding awareness is key when handling files or APIs.

## binary
# A string with a character that is valid in UTF-8 but might cause issues
# if treated as raw binary in other encodings
utf8_string = "你好"
# Convert to ASCII-8BIT (binary)
binary_string = utf8_string.b
puts "Original encoding: #{utf8_string.encoding}"
puts "Binary encoding: #{binary_string.encoding}"
# Example of working with raw bytes
# This might represent a sequence of bytes from a file or network stream
raw_bytes = "\x80\x01\x02\x03".b
puts "Raw bytes encoding: #{raw_bytes.encoding}"

##### Iteration
## each_char
"Ruby".each_char { |ch| puts ch }

## each_byte
# Iterates through the bytes of a string.
# Each byte is an integer between 0–255 representing the character’s ASCII value (or part of a multibyte sequence if UTF-8).
str = "ABC"
str.each_byte { |byte| puts byte }
# Useful for binary data processing or when working with low-level file/network protocols.
# For UTF-8 characters beyond ASCII, a single character might be multiple bytes.

## each_codepoint
# Iterates through Unicode codepoints of a string.
# Codepoints are integers representing Unicode characters, not just bytes.
str = "A😊"
str.each_codepoint { |cp| puts cp }
# Preferred for multilingual text processing, as it respects full characters instead of splitting them into bytes.
# Important in Unicode-heavy applications like messaging apps.

str = "😊"
puts "Bytes:"
p str.bytes   # [240, 159, 152, 138] → UTF-8 encoding bytes
puts "Codepoints:"
p str.codepoints  # [128522] → single Unicode codepoint

##### Miscellaneous Useful Ones
## reverse
str = "Ruby"
p str.reverse        # "ybuR"

## center(width, padstr = ' ') -> Centers a string within a given width, padding with the given string.
p "Ruby".center(10)           # "   Ruby   "
p "Ruby".center(10, "-")      # "---Ruby---"

## ljust(width, padstr = ' ') -> Left-justifies a string, padding to the right.
p "Ruby".ljust(10, ".")       # "Ruby......"

## rjust(width, padstr = ' ') -> Right-justifies a string, padding to the left.
puts "Ruby".rjust(10, ".")       # "......Ruby"

## ord -> Returns the integer Unicode codepoint of the first character.
puts "A".ord                     # 65
puts "Apple".ord                 # 65
puts "€".ord                     # 8364

## chr -> Returns a string containing the character represented by an integer.
puts 65.chr                      # "A"
# puts 8364.chr                    # "€" # but 8364 out of char range (RangeError)

## sum(n = 16) -> Returns a checksum of the bytes in the string, modulo 2^n.
puts "abc".sum                   # 294
puts "abc".sum(8)                # 38  (modulo 2^8)

## tr(from_str, to_str) -> Translates characters in from_str to corresponding ones in to_str.
puts "hello".tr("el", "ip")      # "hippo"  (e → i, l → p)
puts "12345".tr("1-5", "a-e")    # "abcde"

## tr_s(from_str, to_str) -> Like tr, but squeezes consecutive identical characters after translation.
puts "hello".tr_s("el", "ip")    # "hipo"   (two p’s squeezed to one)
puts "yellow".tr_s("l", "r")     # "yerow"

## delete([other_str]+) -> Deletes all characters that appear in any argument.
puts "hello".delete("el")        # "ho"
puts "hello".delete("aeiou")     # "hll"

## squeeze([other_str]+) -> Removes consecutive duplicate characters. If a set is given, only squeezes that set.
puts "yellow moon".squeeze       # "yelow mon"
puts "yellow moon".squeeze("m")  # "yellow mon"

## crypt(salt) -> Encrypts a string using Unix crypt with a given salt.
puts "password".crypt("ab")      # "ab1HZ5M5K7j8s"
# crypt is system-dependent and not secure for modern password storage

## unpack(format) -> Decodes the string according to a template (inverse of Array#pack).
puts "abc".unpack("U*")          # [97, 98, 99]  (Unicode codepoints)
puts "\x00\x0A".unpack("n")      # [10]  (unsigned 16-bit big-endian)

## bytes -> Returns an array of the bytes in the string.
puts "ABC".bytes                 # [65, 66, 67]

## == -> Checks if two strings are identical in content.
p "Ruby" == "Ruby"            # true
p "Ruby" == "ruby"            # false

## casecmp(other_str) -> Case-insensitive comparison. Returns 0 if equal, 1 if self > other, -1 if self < other, or nil if incomparable.
puts "Ruby".casecmp("ruby")      # 0
puts "abc".casecmp("xyz")        # -1









# str = "Ruby"

# p str.reverse        # "ybuR"

# p str.concat(" on Rails") # "Ruby on Rails"

# p str << "!"         # appends in place → "Ruby!"

# p str.chars         # ["R", "u", "b", "y", " ", "o", "n", " ", "R", "a", "i", "l", "s", "!"]

# p str.split("")     # ["R", "u", "b", "y", " ", "o", "n", " ", "R", "a", "i", "l", "s", "!"]
# # split can take regex, allowing powerful splitting.

## Interesting: Many methods have bang (!) versions like strip!, upcase! — 
## these modify the string in place and return nil if no change happened.