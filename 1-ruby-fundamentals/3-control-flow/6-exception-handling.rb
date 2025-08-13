# begin, rescue, ensure

begin
  num = 10 / 0
rescue ZeroDivisionError => e
  puts "Error: #{e.message}"
ensure
  puts "Always runs"
end

# rescue: Handles errors.
# ensure: Runs whether or not an error occurred (like finally).

## Interesting: Ruby allows multiple rescue clauses and even a generic rescue => e.

## Interview Tip: Demonstrate usage in file I/O, API calls, DB interactions.

### File I/O: Reading a file safely
begin
  file = File.open("data.txt", "r")
  contents = file.read
  puts contents
rescue Errno::ENOENT => e
  puts "File not found: #{e.message}"
rescue => e
  puts "Something went wrong: #{e.message}"
ensure
  file.close if file
  puts "File operation complete."
end

### API Call (Using Net::HTTP)
require 'net/http'
require 'uri'

begin
  uri = URI("https://jsonplaceholder.typicode.com/posts/1")
  response = Net::HTTP.get_response(uri)

  if response.is_a?(Net::HTTPSuccess)
    puts "Response: #{response.body}"
  else
    raise "API returned error: #{response.code}"
  end

rescue SocketError => e
  puts "Network error: #{e.message}"
rescue => e
  puts "API call failed: #{e.message}"
ensure
  puts "API call attempted"
end

### Database Interaction (e.g., Rails / ActiveRecord)
=begin

begin
  user = User.find_by(email: "test@example.com")

  if user
    puts "User found: #{user.name}"
  else
    raise "User not found"
  end

rescue ActiveRecord::RecordNotFound => e
  puts "Record not found: #{e.message}"
rescue => e
  puts "Database error: #{e.message}"
ensure
  puts "DB query complete"
end

=end