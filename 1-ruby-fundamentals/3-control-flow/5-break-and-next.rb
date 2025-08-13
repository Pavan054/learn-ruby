# break and next

(1..6).each do |i|
    next if i == 3
    break if i == 5
    puts i
end

## Output: 1, 2, 4 (skips 3, breaks at 5)

## Interview Tip: Great for fine-tuning loop control.