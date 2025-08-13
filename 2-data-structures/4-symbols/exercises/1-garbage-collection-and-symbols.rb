## Garbage Collection and Symbols

# Exercise:
# Dynamically create many symbols using `to_sym` in a loop.
# Observe memory usage in Ruby 2.1+ vs older versions.

## Background
# Before Ruby 2.2 — Symbols were never garbage collected, so dynamically creating lots of them could cause a memory leak.
# Ruby 2.2+ — Symbols created dynamically can be garbage collected, so memory growth is controlled.

# Garbage Collection & Symbols Test
# Run this and monitor memory usage.

def memory_usage
  `ps -o rss= -p #{Process.pid}`.to_i # RSS in KB
end

puts "Ruby version: #{RUBY_VERSION}"
puts "Initial memory: #{memory_usage} KB"

# Dynamically create MANY symbols
1_000_000.times do |i|
  "symbol_#{i}".to_sym
end

puts "Memory after creating symbols: #{memory_usage} KB"

GC.start # Force garbage collection

puts "Memory after GC: #{memory_usage} KB"

## response

# Ruby version: 3.4.4
# Initial memory: 13456 KB
# Memory after creating symbols: 15408 KB
# Memory after GC: 15408 KB

#### "Why didn’t memory drop after GC for symbols in Ruby 3.x?"

# In Ruby, even though dynamic symbols can be garbage collected (since Ruby 2.2), 
# unique symbols are still interned in the global symbol table and won’t be freed until there are no references anywhere. 
# Creating a large number of unique symbols in a long-lived process will still increase memory usage permanently.
