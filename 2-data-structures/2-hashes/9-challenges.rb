#### Beginner Challenges

### Convert an array to a frequency hash
# Given:
arr = ["a", "b", "a", "c", "b", "a"]
# Expected:
# {"a"=>3, "b"=>2, "c"=>1}
# Challenge: Write a method `frequency_hash(arr)` that returns the above result.

def frequency_hash(arr)
    res = Hash.new(0)
    arr.each { |element| res[element]+=1 }
    res
end
p frequency_hash(arr)

### Sum values in a hash
# Given:
h = { apples: 5, bananas: 3, oranges: 4 }
# Expected:
# 12
# Challenge: Write a method `sum_hash_values(h)` that returns the total sum of values.

def sum_hash_values(h)
    sum = 0
    h.each { |_, v| sum+=v }
    sum
end

p sum_hash_values(h)

def simple_sum_hash_values(h)
    h.values.sum
end

p simple_sum_hash_values(h)

### Find keys with max value
# Given:
scores = { alice: 42, bob: 55, john: 55, carol: 39 }
# Expected:
# [:bob, :john]
# Challenge: Write a method `top_scorers(scores)` that returns keys with the highest score.

def top_scorers(scores)
    result = Hash.new { |h, k| h[k] = [] }
    scores.each { |key, value| result[value] << key }
    result.select { |key, value| value.size > 1 }.values.first
end

p top_scorers(scores)

#### Intermediate Challenges

### Group words by their first letter
# Given:
words = ["apple", "banana", "apricot", "blueberry", "cherry"]
# Expected:
# {
#   "a"=>["apple", "apricot"],
#   "b"=>["banana", "blueberry"],
#   "c"=>["cherry"]
# }
# Challenge: Write `group_by_first_letter(words)`

def group_by_first_letter(words)
    result = Hash.new { |h, k| h[k] = [] }
    words.each { |word| result[word.chr] << word }
    result
end

p group_by_first_letter(words)

### Swap keys and values, remove duplicates
# Given:
h = { a: 1, b: 2, c: 1, d: 3 }
# Expected:
# {1=>:c, 2=>:b, 3=>:d} # overwrite on duplicate values
# Challenge: Write `invert_overwrite(h)`

def invert_overwrite(h)
    result = {}
    h.each { |key, value| result[value] = key }
    result
end

p invert_overwrite(h)

def invert_overwrite_simpler(h)
    h.invert
end

p invert_overwrite_simpler(h)

### Remove key-value pairs where value is nil or empty
# Given:
h = { name: "Alice", email: nil, phone: "", address: "Wonderland" }
# Expected:
# { name: "Alice", address: "Wonderland" }
# Challenge: Write `clean_hash(h)`

def clean_hash(h)
    h.reject { |_, v| v.nil? || v.empty? }
end

p clean_hash(h)

#### Advanced Challenges

### Merge two hashes with array values
# Given:
a = { ruby: ["basics"], js: ["intro"] }
b = { ruby: ["intermediate", "advanced"], python: ["data"] }
# Expected:
# { ruby: ["basics", "intermediate", "advanced"], js: ["intro"], python: ["data"] }
# Challenge: Write `deep_merge_hashes(a, b)`

def deep_merge_hashes(a, b)
    res = a.dup
    b.each do |key, value|
        if res.key?(key) && res[key].is_a?(Array) && value.is_a?(Array)
            res[key] += value
        else
            res[key] = value
        end
    end
    res
end

p deep_merge_hashes(a, b)

def deep_merge_hashes2(a, b)
    a.merge(b) { |_key, old, new| old + new }
end

p deep_merge_hashes2(a, b)

### Count characters in string and return sorted hash by frequency
# Given:
str = "banana"
# Expected:
# {"a"=>3, "n"=>2, "b"=>1}
# Challenge: Write `char_count_sorted(str)`

def char_count_sorted(str)
    res = Hash.new(0)
    str.each_char do |char|
        res[char] += 1
    end
    res
end

p char_count_sorted(str)

### Flatten a nested hash
# Given:
nested = {
  user: {
    name: "Alice",
    details: {
      email: "a@a.com",
      age: 30
    }
  }
}
# Expected:
# {
#   "user.name" => "Alice",
#   "user.details.email" => "a@a.com",
#   "user.details.age" => 30
# }
# Challenge: Write `flatten_hash(nested)`

def flatten_hash(hash, parent_key = '', result = {})
  hash.each do |key, value|
    full_key = parent_key.empty? ? key.to_s : "#{parent_key}.#{key}"

    if value.is_a?(Hash)
      flatten_hash(value, full_key, result)
    else
      result[full_key] = value
    end
  end
  result
end

p flatten_hash(nested)

### Check if two hashes are shallow-anagrams
# Given:
h1 = { a: 2, b: 1 }
h2 = { b: 1, a: 2 }
# Expected: true
h3 = { a: 1, b: 2 } # → false
# Challenge: Write `hash_anagram?(h1, h2)` — compare if both hashes have same keys & values

def hash_anagram?(h1, h2)
  return false unless h1.keys.sort == h2.keys.sort
  h1.all? { |k, v| h2[k] == v }
end

p hash_anagram?(h1, h2)
p hash_anagram?(h1, h3)

def hash_anagram2?(h1, h2)
    h1 == h2
end

p hash_anagram2?(h1, h2)
p hash_anagram2?(h1, h3)
