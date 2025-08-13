# while

puts "while"
i = 0
while i < 3
  puts i
  i += 1
end

# until

puts"until"
i = 0
until i == 3
  puts i
  i += 1
end

# for

puts "for"
for i in 1..3
  puts i
end

## Interview Tip: Prefer each or other iterators over for in idiomatic Ruby.