### Threads

# A Thread is the smallest unit of execution. Ruby supports native threads (mapped to OS threads).

t1 = Thread.new { 5.times { puts "A"; sleep 0.5 } }
t2 = Thread.new { 5.times { puts "B"; sleep 0.5 } }

t1.join
t2.join

# Output: A and B interleaved (concurrent execution).

## Interview Note:
# Threads in MRI Ruby are concurrent, but not truly parallel because of the GIL.
# In JRuby or TruffleRuby, threads can run in parallel.