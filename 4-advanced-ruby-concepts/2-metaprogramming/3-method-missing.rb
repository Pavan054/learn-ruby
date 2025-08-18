### method_missing

# Ruby calls method_missing when you call a method that doesn’t exist.

class DynamicFinder
  def method_missing(method, *args)
    if method.to_s.start_with?("find_by_")
      field = method.to_s.split("find_by_").last
      "Looking up by #{field} = #{args.first}"
    else
      super
    end
  end
end

obj = DynamicFinder.new
puts obj.find_by_name("Alice")   # => "Looking up by name = Alice"
# puts obj.hello                  # => NoMethodError (falls back to super)

# This is how ActiveRecord dynamic finders (find_by_name, find_by_email) worked before Rails 4.

## Interview Tip: Always mention that you should also override respond_to_missing? for correct behavior with respond_to?.