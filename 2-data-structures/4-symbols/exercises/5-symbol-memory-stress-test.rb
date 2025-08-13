## Symbol Memory Stress Test

# Challenge:
# Write a program that generates 1 million unique symbols using to_sym and object_id.
# Measure memory usage before and after.
# Observe if Ruby version supports symbol GC.

# Symbol Memory Stress Test

def memory_usage
  `ps -o rss= -p #{Process.pid}`.to_i # in KB
end

puts "Ruby version: #{RUBY_VERSION}"
initial_mem = memory_usage
puts "Initial memory: #{initial_mem} KB"

# Create 1 million unique symbols
1_000_000.times do |i|
  "symbol_#{i}_#{object_id}".to_sym
end

mid_mem = memory_usage
puts "Memory after creating symbols: #{mid_mem} KB"

GC.start # Force garbage collection

after_gc_mem = memory_usage
puts "Memory after GC: #{after_gc_mem} KB"

# Result analysis
if after_gc_mem < mid_mem
  puts "✅ This Ruby version supports Symbol Garbage Collection."
else
  puts "❌ This Ruby version retains dynamic symbols in memory."
end

### How This Works
# memory_usage method
#     - Uses ps to fetch the current process’s resident set size in KB.
#     - This is more reliable than ObjectSpace.memsize_of_all for this test.
# Unique Symbols
#     - to_sym on "symbol_#{i}_#{object_id}" ensures that all generated symbols are unique, preventing symbol re-use.
# GC Trigger
#     - Calls GC.start to explicitly run garbage collection after symbol creation.
# Symbol GC Detection
#     - If after_gc_mem < mid_mem, symbols were garbage-collected (Ruby 2.2+ supports this).
#     - If not, your Ruby keeps symbols alive (pre-2.2 or some frozen-symbol cases).

### Expected Results
# Ruby 2.1 and older: Memory won’t drop — symbols are immortal.
# Ruby 2.2+: Memory will drop after GC.
# Ruby 3.x: Should show drop, but sometimes minimal if OS memory allocator holds the memory.