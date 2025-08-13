# if, elsif, else

# if
age = 25

if age < 18
    puts "Minor"
elsif age < 60
    puts "Adult"
else
    puts "senior"
end

# Interesting: Ruby also allows unless, which is like if not.

logged_in = false
puts "Please login" unless logged_in  # Executes if logged_in is false

# Interview Tip: Use unless only when there is no else, to keep readability.