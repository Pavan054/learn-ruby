## Array Iteration

arr = [10, 20, 35]

# each
arr.each { |i| puts i }

# map
p arr.map { |i| i*i }

# select
p arr.select{ |i| i < 25 }

# reject
p arr.reject{ |i| i < 25 }

###  Interview Tip: Know when to use each vs map vs select:
# each: side effects (like printing/logging)
# map: transform and return new array
# select: filter elements based on a condition

p arr.filter_map { |x| x if x.even? } # Ruby 2.7+