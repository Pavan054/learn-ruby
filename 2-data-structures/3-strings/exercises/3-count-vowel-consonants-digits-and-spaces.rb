# Input: "Ruby 3 is great!"
# Output: Vowels: 4, Consonants: 7, Digits: 1, Spaces: 3

def analyze_string(str)
  vowels = consonants = digits = spaces = 0
  vowel_set = "aeiouAEIOU"

  str.each_char do |char|
    if vowel_set.include?(char)
      vowels += 1
    elsif char.match?(/[a-zA-Z]/)
      consonants += 1
    elsif char.match?(/\d/)
      digits += 1
    elsif char == " "
      spaces += 1
    end
  end

  puts "Vowels: #{vowels}, Consonants: #{consonants}, Digits: #{digits}, Spaces: #{spaces}"
end

# Usage
input = "Ruby 3 is great!"
analyze_string(input)


=begin
Explanation:

each_char → iterates through each character (O(n)).
include? → checks vowels (O(1) since vowel_set is short).
match?(/[a-zA-Z]/) → checks letters.
match?(/\d/) → checks digits.
Direct check for space " ".
=end

### Time Complexity: O(n)
### Space Complexity: O(1) (constant extra space for counters)

# If you want to avoid regex completely (some interviewers like this), you can check ASCII ranges:
def analyze_string2(str)
  vowels = consonants = digits = spaces = 0
  vowel_set = "aeiouAEIOU"

  str.each_char do |char|
    if vowel_set.include?(char)
      vowels += 1
    elsif char >= 'a' && char <= 'z' || char >= 'A' && char <= 'Z'
      consonants += 1
    elsif char >= '0' && char <= '9'
      digits += 1
    elsif char == " "
      spaces += 1
    end
  end

  puts "Vowels: #{vowels}, Consonants: #{consonants}, Digits: #{digits}, Spaces: #{spaces}"
end

# Usage
input = "Ruby 3 is great!"
analyze_string2(input)

# No regex → faster for small fixed checks.
# O(n) time, O(1) space.
# Interviewers often like this because it shows you know character ranges.