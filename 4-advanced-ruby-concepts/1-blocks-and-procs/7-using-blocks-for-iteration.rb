### Using Blocks for Iteration

# Blocks are heavily used in iteration/enumeration (each, map, select, etc).

[1,2,3,4].map { |n| n * 2 }       # => [2,4,6,8]
[1,2,3,4].select { |n| n.even? }  # => [2,4]

## Interview Tip:
# Rails and ActiveRecord use blocks extensively:
=begin
User.where(active: true).each do |user|
  puts user.name
end
=end