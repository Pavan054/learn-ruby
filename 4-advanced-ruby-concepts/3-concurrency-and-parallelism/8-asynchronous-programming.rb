### Asynchronous Programming

# Asynchronous = Don’t block the main thread while waiting for I/O.

# Example with EventMachine:
require 'eventmachine'

EM.run do
  EM.add_timer(1) { puts "Hello after 1s"; EM.stop }
  puts "Non-blocking"
end

# Prints “Non-blocking” immediately, then after 1 second “Hello after 1s”.

# Modern Alternative: Async gem (based on Fibers in Ruby 3).