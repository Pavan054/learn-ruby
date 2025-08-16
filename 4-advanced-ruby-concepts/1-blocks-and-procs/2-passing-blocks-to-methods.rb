### Passing Blocks to Methods

# Instead of yield, you can accept blocks explicitly using &block.

def custom_each(array, &block)
  for item in array
    block.call(item)
  end
end

custom_each([1,2,3]) { |n| puts n * 2 }
# Output: 2, 4, 6

## Interesting:
#   - &block converts block → Proc.
#   - You can pass the block around and call it later.