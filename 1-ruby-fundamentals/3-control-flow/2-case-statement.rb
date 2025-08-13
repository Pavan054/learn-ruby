# Switch equivalent

day = "Sunday"

case day
when "Monday", "Tuesday"
  puts "Weekday"
when "Saturday", "Sunday"
  puts "Weekend"
else
  puts "Unknown day"
end

# Interesting: Multiple when values are allowed. Good alternative to if-elsif chains.

# Interview Tip: Cleaner for matching against a single variable.