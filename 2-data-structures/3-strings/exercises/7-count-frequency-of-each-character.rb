# Count Frequency of Each Character

# Input: "programming"
# Output: {"p"=>1, "r"=>2, "o"=>1, "g"=>2, "a"=>1, "m"=>2, "i"=>1, "n"=>1}
# Hint: `each_char` + Hash

input = "programming"

def frequency_of_each_character(str)
    result = Hash.new(0)
    str.each_char { |ch| result[ch]+=1 }
    result
end

puts frequency_of_each_character(input)

# Time Complexity → O(n) (one pass through the string)
# Space Complexity → O(k) (where k = number of unique characters)

## one-liner
puts freq = input.each_char.tally
# => {"p"=>1, "r"=>2, "o"=>1, "g"=>2, "a"=>1, "m"=>2, "i"=>1, "n"=>1}

# Time Complexity: O(n)
# Space Complexity: O(k)
