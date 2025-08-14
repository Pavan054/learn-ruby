### Return Values

# Ruby returns the last evaluated expression automatically.
def multiply(a, b)
  a * b
end
puts multiply(3, 4)  # 12

# You can also use return explicitly:
def check(num)
  return "Even" if num.even?
  "Odd"
end

puts check(4)
puts check(5)