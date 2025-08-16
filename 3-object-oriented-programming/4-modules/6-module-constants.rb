### Module Constants

# Constants are stored in modules.

module Config
  VERSION = "1.0"
end

puts Config::VERSION   # => "1.0"

# Constants can technically be changed, but Ruby will give a warning, not an error.