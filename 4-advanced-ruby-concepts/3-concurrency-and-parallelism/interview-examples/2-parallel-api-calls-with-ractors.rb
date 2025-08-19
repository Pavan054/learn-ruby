### Parallel API Calls with Ractors

# Works in Ruby 3.0+ (since Ractors were introduced there).

# Do the HTTP call outside Ractor, process inside Ractor
# If your goal is to parallelize data processing, do the I/O in the main thread, then send JSON to Ractors:
require 'net/http'
require 'json'

urls = [
  "https://jsonplaceholder.typicode.com/todos/1",
  "https://jsonplaceholder.typicode.com/todos/2",
  "https://jsonplaceholder.typicode.com/todos/3"
]

# Fetch all data first (IO-bound)
responses = urls.map do |url|
  uri = URI(url)
  res = Net::HTTP.get(uri)
  JSON.parse(res)
end

# Now parallelize CPU-heavy work
ractors = responses.map do |data|
  Ractor.new(data) do |task|
    # simulate heavy computation
    sleep 1
    { id: task["id"], title: task["title"].upcase }
  end
end

results = ractors.map(&:take)

puts results
# Works because only pure JSON hashes are sent to Ractors (shareable).

# Use Open3 or subprocesses for true parallel HTTP calls
# Instead of Net::HTTP inside Ractors, use an external command like curl:
require 'json'
require 'open3'

urlss = [
  "https://jsonplaceholder.typicode.com/todos/1",
  "https://jsonplaceholder.typicode.com/todos/2",
  "https://jsonplaceholder.typicode.com/todos/3"
]

ractorss = urlss.map do |url|
  Ractor.new(url) do |u|
    output, _ = Open3.capture2("curl -s #{u}")
    JSON.parse(output)
  end
end

resultss = ractorss.map(&:take)

puts resultss
# This bypasses the Ractor isolation problem, since curl runs outside Ruby’s VM.

### In interviews, you can say:
### “Ractors isolate memory for true parallelism, but many Ruby libraries (like Net::HTTP) aren’t Ractor-safe. 
### In practice, I’d use Futures (threads) for I/O-bound tasks like API calls, and reserve Ractors for CPU-bound tasks (data crunching, ML, encryption).
