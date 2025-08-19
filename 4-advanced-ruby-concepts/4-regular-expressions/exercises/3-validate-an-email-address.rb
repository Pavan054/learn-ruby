### Validate an Email Address

# A simple (not RFC-perfect, but good enough for interviews) email regex:

def valid_email?(email)
  !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
end

puts valid_email?("pavan@example.com")   # true
puts valid_email?("wrong@com")           # false

# Explanation:
#     -   \A and \z → match start & end of string (not just line).
#     -   [\w+\-.]+ → word chars, +, -, . allowed in username.
#     -   @[a-z\d\-.]+ → domain part.
#     -   \.[a-z]+ → must end with .something.
#     -   /i → case-insensitive.

## Interview Tip: Say that email regex can get crazy complex (full RFC is huge), so we usually use libraries like URI::MailTo::EMAIL_REGEXP.