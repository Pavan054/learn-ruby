# Shift each letter by 1 (Caesar Cipher style)
# Input: "abc xyz"
# Output: "bcd yza"

str = "abc xyz"
encrypted = str.tr("a-yz", "b-za")
puts encrypted  # "bcd yza"

# How it works?
# "a-yz" means all letters from a to y plus z.
# "b-za" maps:
# a → b, b → c, …, y → z
# z → a (wrap-around)

## handle uppercase too
str = "Abc Xyz"
encrypted = str.tr("a-yzA-YZ", "b-zaB-ZA")
puts encrypted  # "Bcd Yza"

# Time Complexity
# O(n) — tr internally processes each character once.
# O(1) extra space.

### with converting character to ASCII value
str = "abc xyz"
shifted = ""

str.each_char do |char|
  if char >= 'a' && char <= 'z'
    shifted << ((char.ord - 'a'.ord + 1) % 26 + 'a'.ord).chr
  elsif char >= 'A' && char <= 'Z'
    shifted << ((char.ord - 'A'.ord + 1) % 26 + 'A'.ord).chr
  else
    shifted << char  # keep spaces or other characters as is
  end
end

puts shifted  # "bcd yza"


# How it works?
# char.ord → converts character to ASCII code.
# Subtract 'a'.ord (or 'A'.ord) to get 0–25 range.
# Add 1 to shift by 1 position.
# % 26 ensures wrap-around (z → a).
# Add base ASCII again and use .chr to get character.

# Time Complexity
# O(n) — iterates over each character once.
# O(1) extra space (excluding result string).