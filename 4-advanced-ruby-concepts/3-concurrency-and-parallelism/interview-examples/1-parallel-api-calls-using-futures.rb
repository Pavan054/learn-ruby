### parallel API calls using Futures

require 'concurrent-ruby'
require 'net/http'
require 'json'

# Simulated API fetcher
def fetch_api(url)
  uri = URI(url)
  res = Net::HTTP.get(uri)
  JSON.parse(res)
end

# Create 3 futures to fetch data in parallel
future1 = Concurrent::Future.execute { fetch_api("https://jsonplaceholder.typicode.com/todos/1") }
future2 = Concurrent::Future.execute { fetch_api("https://jsonplaceholder.typicode.com/todos/2") }
future3 = Concurrent::Future.execute { fetch_api("https://jsonplaceholder.typicode.com/todos/3") }

# Wait for all to finish and merge results
results = [future1, future2, future3].map(&:value)

puts "Merged Results:"
puts results

# output:
# Merged Results:
# [{"userId"=>1, "id"=>1, "title"=>"delectus aut autem", "completed"=>false},
#  {"userId"=>1, "id"=>2, "title"=>"quis ut nam facilis et officia qui", "completed"=>false},
#  {"userId"=>1, "id"=>3, "title"=>"fugiat veniam minus", "completed"=>false}]

## Why this is interview gold:
    # -   Shows practical concurrency (not just toy threads).
    # -   Explains why: "We need concurrency to make I/O-bound tasks like API calls faster."
    # -   Demonstrates patterns (Future/Promise).
    # -   You can extend to error handling (futures can capture exceptions).
    # -   You can compare with Ractors for CPU-bound tasks.

    # If asked “How would you scale an API aggregator service?”, you can say:
    # -   Use Futures for I/O concurrency.
    # -   Use Ractors for CPU-intensive processing.
    # -   This avoids GIL issues and maximizes performance.