### Ractors (Ruby 3+)

# Introduced in Ruby 3 to enable true parallel execution despite the GIL.
#     Each Ractor has its own memory.
#     Communication is via message passing.

r = Ractor.new do
  msg = Ractor.receive
  "Hello, #{msg}"
end

r.send("Pavan")
puts r.take    # => "Hello, Pavan"
# Along with output it gave warning - "warning: Ractor is experimental, and the behavior may change in future versions of Ruby! Also there are many implementation issues."

# Unlike Threads, Ractors can run in parallel on multiple CPU cores.

## Interview Note: Ractors solve Ruby’s parallelism problem but come with complexity (no shared mutable state).