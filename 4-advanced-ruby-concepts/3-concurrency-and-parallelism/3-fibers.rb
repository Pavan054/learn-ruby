### Fibers

# Fibers are lightweight, cooperative threads — they don’t run automatically;
# you explicitly control when to switch (resume, yield).

fiber = Fiber.new do
  puts "Fiber started"
  Fiber.yield
  puts "Fiber resumed"
end

fiber.resume   # => "Fiber started"
fiber.resume   # => "Fiber resumed"

# Used for async I/O (e.g., async gem, falcon web server).

## Interview Note: Fibers give deterministic concurrency (you control when switching happens), unlike threads which are preemptive.