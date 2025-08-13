# For dealing with temporal data.

require 'date'

today = Date.today
puts today
puts today.class
puts today.class.class

now = Time.now
puts now
puts now.class
puts now.class.class

# Time is built-in; Date requires the date library.