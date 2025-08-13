# Symbols are commonly used as hash keys for performance:

# Symbol keys
user = { name: "Pavan", role: "Developer" }
puts user[:name]  # "Pavan"

# String keys (slower comparison)
user_str = { "name" => "Pavan" }
puts user_str["name"]

# Interview Tip:
# Rails defaults to symbol keys for params in newer versions (strong parameters often use symbolized keys internally).