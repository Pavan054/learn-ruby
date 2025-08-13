# Single quotes (no interpolation or special chars except \\ and \')
s1 = 'Ruby'
puts s1

# Double quotes (supports interpolation and escape sequences)
RUBY_VERSION = '3.0.0'
s2 = "Ruby version is #{RUBY_VERSION}"
puts s2

# %Q (like double quotes)
s3 = %Q(Hello "World")
puts s3

# %q (like single quotes)
s4 = %q(Hello 'World')
puts s4

# Here-documents
s5 = <<TEXT
This is a
multi-line string.
TEXT
puts s5

s6 = String.new("Hi")  # using constructor
puts s6
