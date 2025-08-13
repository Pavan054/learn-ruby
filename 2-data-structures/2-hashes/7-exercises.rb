#### Count word frequency in a sentence
# Input:
sentence = "hello world hello ruby world"

# Expected output:
# {"hello"=>2, "world"=>2, "ruby"=>1}

result = Hash.new(0)
sentence.split.each { |word| result[word]+=1 }
p result

#### Invert a Hash
h = { a: 1, b: 2, c: 3 }
# Expected: {1=>:a, 2=>:b, 3=>:c}

p h.invert

p h

new_h = {}
h.each do |k, v|
    new_h[v] = k
end
p new_h

#### Group items by length
words = ["hi", "hello", "hey", "world", "no"]
# Expected:
# {2=>["hi", "no"], 5=>["hello", "world"], 3=>["hey"]}

result = Hash.new { |h, k| h[k]=[]}
words.each { |word| result[word.length] << word }
p result

#### Merge two hashes with addition on value conflict
a = { apples: 2, bananas: 3 }
b = { bananas: 1, oranges: 4 }
# Expected: {:apples=>2, :bananas=>4, :oranges=>4}

p a.merge(b)    # => {apples: 2, bananas: 1, oranges: 4}

p a.merge(b) { |_key, old, new| old + new }     # => {apples: 2, bananas: 4, oranges: 4}

res = Hash.new(0)
a.each { |k, v| res[k]+=v }
b.each { |k, v| res[k]+=v }
p res

#### Find duplicate values and their keys
h = { a: 1, b: 2, c: 1, d: 3 }
# Expected:
# {1=>[:a, :c]}

res = Hash.new { |h, k| h[k] = [] }
h.each { |k, v| res[v] << k }
p res
p res.select { |k, v| v.size > 1 }

#### Convert array of key-value pairs to hash
pairs = [[:a, 1], [:b, 2], [:c, 3]]
# Expected: {:a=>1, :b=>2, :c=>3}

puts Hash[pairs]

res = {}
pairs.each do |k, v|
    res[k] = v
end
p res