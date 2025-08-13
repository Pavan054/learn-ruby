arr = [1, 2, 2, 5, 4, nil, 3]

p arr.length        # => 7
p arr.first         # => 1
p arr.last          # => 3
p arr.include?(3)   # => true
p arr.reverse       # => [3, nil, 4, 5, 2, 2, 1]
p arr.sample        # => random element
p arr.uniq          # removes duplicates
p arr.compact       # removes nil values

arr = [1, 2, 2, 5, 4, 3]
p arr.sort          # => [1, 2, 2, 3, 4, 5]

arr = [[1, 3], ["Pavan", "Deepika", "Anvi"]]
p arr.flatten       # flattens nested arrays

## arr.compact is helpful when filtering out nils before processing.

arr = [1, 2, 2, 5, 4, 3]
p arr.index(2)            # => index of 2
p arr.find { |x| x > 3 }  # => first match
p arr.rindex(2)           # => last index of 2
p arr.count(2)            # => count of 2s
p arr.group_by { |x| x.even? }  # => {true=>[2, 2, 4], false=>[1,5,3]}

arr = [1, 2, 2, 5, 4, 3]
p arr.shuffle                   # Shuffles array
p arr.zip([:a, :b, :c, :d, :e, :f])         # => [[1, :a], [2, :b], [2, :c], [5, :d], [4, :e], [3, :f]]
p arr.rotate(2)                 # Left rotate
p arr.fill("x", 1, 2)           # => Fills positions 1, 2 with "x"

arr = [1, 2, 3]
p arr.join("-")        # => "1-2-3"
p "1,2,3".split(",")   # => ["1", "2", "3"]
p arr.to_s             # => string version

arr = [[1, 'a'], [2, 'b'], [3, 'c']]
p arr.to_h             # => convert to hash (only if array of pairs)

arr = [1, 2, 2, 5, 4, 3, 6]
p arr.reduce(:+)               # => sum
p arr.any? { |x| x > 2 }       # => true
p arr.all? { |x| x > 0 }       # => true
p arr.none?(&:negative?)       # => true
p arr.each_slice(2).to_a       # => [[1,2], [3,4]]
