# Convert "ruby is awesome" to "Ruby Is Awesome"
# Try both `split` + `map` + `join` and `titleize` (if Rails)

def capitalize_each_word(str)
    str.split.map { |word| word.capitalize }.join(" ")
end

str = "ruby is awesome"

puts capitalize_each_word(str)

=begin
Explanation:
split → breaks string into words (O(n)).
map { |word| word.capitalize } → capitalizes first letter, makes rest lowercase (O(n)).
join(" ") → combines words back into a single string (O(n)).

Time Complexity: O(n)
Space Complexity: O(n) (due to array from split)
=end

## Interesting Variant for Interviews:
## Avoid capitalize and do it manually to show deeper string knowledge.
def title_case_manual(str)
  str.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end.join(" ")
end

puts title_case_manual("ruby is awesome") # Ruby Is Awesome
