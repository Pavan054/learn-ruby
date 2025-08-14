## Nested Hash with Symbol Keys

# Challenge:
# Convert all keys of a nested hash to symbols (deep symbolization).

# Example:
# input = {"name" => "Alice", "details" => {"age" => 25, "city" => "Paris"}}
# Output: {:name=>"Alice", :details=>{:age=>25, :city=>"Paris"}}

# 1
def deep_symbolize_keys(obj)
  case obj
  when Hash
    obj.each_with_object({}) do |(k, v), result|
      result[k.to_sym] = deep_symbolize_keys(v)
    end
  when Array
    obj.map { |item| deep_symbolize_keys(item) }
  else
    obj
  end
end

# Example usage
input = {"name" => "Alice", "details" => {"age" => 25, "city" => "Paris"}}
output = deep_symbolize_keys(input)
puts output

# How It Works
# If the object is a Hash →
#     Convert each key to a symbol (k.to_sym)
#     Recursively process each value.
# If the object is an Array →
#     Recursively process each element.
# Else →
#     Return the object as-is.

# Time Complexity
#     - O(n) — where n is the total number of keys and array elements in the structure.
#     - We visit each element exactly once.
# Space Complexity
#     - O(n) — due to creating a new nested structure of the same size.