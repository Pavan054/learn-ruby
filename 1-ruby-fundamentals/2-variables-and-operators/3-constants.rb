# Defined with uppercase letters:

MAX_USERS = 100
puts MAX_USERS

MAX_USERS = 200
puts MAX_USERS

# Namespaced access:

module MyApp
  VERSION = "1.0"
end

puts MyApp::VERSION

MyApp::VERSION = "2.0"

puts MyApp::VERSION

## Interesting:
# Constants can be used like enums or configs.
# Ruby allows reassignment (not best practice), so use them wisely.