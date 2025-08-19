### Concurrent Programming Patterns

# Producer-Consumer: One thread produces, another consumes (e.g., Queue).
# Future/Promise: A placeholder for a value that will be available later.
# Actor Model: Each worker has its own mailbox (similar to Ractors).

require 'concurrent-ruby'

future = Concurrent::Future.execute { 5 * 5 }
puts future
puts future.value  # => 25

# concurrent-ruby gem is widely used for these patterns.

### Producer–Consumer (with Queue)

# Queue is thread-safe in Ruby, so it’s ideal for producer-consumer problems.

queue = Queue.new

# Producer thread
producer = Thread.new do
  5.times do |i|
    sleep 0.5
    queue << "item #{i}"
    puts "Produced item #{i}"
  end
end

# Consumer thread
consumer = Thread.new do
  5.times do
    item = queue.pop
    puts "Consumed #{item}"
  end
end

producer.join
consumer.join

# Output: Producer and Consumer run concurrently, items flow through the queue.

## Interview Note:
# Queue is thread-safe.
# You can extend this to multiple producers & consumers.

### Future/Promise (with concurrent-ruby)

# A Future represents a computation that runs in the background, and you can fetch its result later.

require 'concurrent-ruby'

future = Concurrent::Future.execute do
  sleep 2
  10 * 10
end

puts "Doing other work..."
puts "Future result: #{future.value}"  # waits for result if not ready

# Output: “Doing other work…” appears first, then after 2 seconds, result: 100.

# Interview Note:
# Futures/Promises help with async tasks (like fetching data from APIs in parallel).
# concurrent-ruby also has Promises which chain results (like JS Promises).

### Actor Model (with concurrent-ruby or Ractors)

# Each Actor has its own mailbox (queue). They process one message at a time, avoiding shared-state issues.

# Example with concurrent-ruby:
# require 'concurrent-ruby'

# class Worker < Concurrent::Actor::Context
#   def receive(message)
#     case message
#     when :ping
#       "pong"
#     when Integer
#       message * 2
#     else
#       "unknown"
#     end
#   end
# end

# actor = Worker.spawn(:my_worker)

# puts actor.ask(:ping).value       # => "pong"
# puts actor.ask(21).value          # => 42

# Giving error - "uninitialized constant Concurrent::Actor (NameError)"
# that error happens because Concurrent::Actor was deprecated and removed from the concurrent-ruby gem starting with 1.1.x.
# So if you try Concurrent::Actor, you’ll get this error only

# If you still want the old Actor system. You can lock gem version 1.0.5 (the last version with Concurrent::Actor).

## “Earlier concurrent-ruby had an Actor model API, but it was deprecated.
## In modern Ruby, we implement Actors using Ractors (introduced in Ruby 3), which isolate state and communicate via message passing.”

# Example with Ractors (Ruby 3):
r = Ractor.new do
  loop do
    msg = Ractor.receive
    break if msg == :stop
    puts "Actor got: #{msg}"
  end
end

puts r.send("Hello")
puts r.send("World")
puts r.send(:stop)

# Interview Note:
# Actor Model is great for parallelism (no shared mutable state).
# In Ruby 3, Ractors are the closest implementation.

### Interview Quick-Pitch
    # -   Producer-Consumer → Queue → safe data exchange between threads.
    # -   Future/Promise → async computations with concurrent-ruby.
    # -   Actor Model → isolation + message passing → use Ractors or concurrent-ruby.

    # If asked “Which one would you use in real-world Rails?”:
    # -   API calls in parallel → Futures/Promises.
    # -   Background workers → Producer-Consumer (with Sidekiq or queues).
    # -   High parallel workloads → Actor model or Ractors.