### Parallel Processing

# For CPU-bound tasks, you can use multiple processes (not threads):

fork do
  puts "In child process #{Process.pid}"
end

puts "In parent process #{Process.pid}"
Process.wait

# Each process runs in parallel (independent memory).

## Interview Note:
# Threads are better for I/O-bound tasks.
# Processes (or Ractors) are better for CPU-bound tasks.