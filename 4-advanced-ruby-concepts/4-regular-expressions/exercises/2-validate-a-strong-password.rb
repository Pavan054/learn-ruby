### Validate a strong password (≥8 chars, at least one digit, one uppercase).

def strong_password?(password)
  !!(password =~ /(?=.*[A-Z])(?=.*\d).{8,}/)
end

puts strong_password?("Pavan123")  # true
puts strong_password?("weakpass")  # false
