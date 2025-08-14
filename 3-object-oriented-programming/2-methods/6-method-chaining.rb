### Method Chaining

# Call multiple methods in one line — methods must return objects (not nil) to chain further.

class Chain
  def step1
    puts "Step 1"
    self
  end
  def step2
    puts "Step 2"
    self
  end
end

Chain.new.step1.step2

## Tip: Useful in DSLs (like Rails ActiveRecord: User.where(active: true).order(:name)).