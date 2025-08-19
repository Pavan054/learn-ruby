### Extract all hashtags from a tweet.

tweet = "Learning #Ruby is fun! #coding #100DaysOfCode"
hashtags = tweet.scan(/#\w+/)
puts hashtags.inspect
# => ["#Ruby", "#coding", "#100DaysOfCode"]
