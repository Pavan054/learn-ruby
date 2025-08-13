## Reverse Symbol Mapping

# Challenge:
# Given a hash with symbol keys and string values, return a new hash with values converted to symbols and keys converted to strings.

# Example:
# input = {name: "ruby", language: "awesome"}
# Output: {"name"=>:ruby, "language"=>:awesome}

# 1
input = {name: "ruby", language: "awesome"}
result = {}
input.each do |key, value|
    result[key.to_s] = value.to_sym
end
p result

# O(n) time, O(n) space for the new hash
