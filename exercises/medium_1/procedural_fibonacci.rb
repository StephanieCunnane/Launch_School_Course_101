def fibonacci(nth)
  two_before_fibonacci = 1
  one_before_fibonacci = 1
  position = 2
  
  until position >= nth
    position += 1
    current_fibonacci = two_before_fibonacci + one_before_fibonacci
    two_before_fibonacci = one_before_fibonacci
    one_before_fibonacci = current_fibonacci
  end
  
  current_fibonacci
end

# Given solution
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [last, first + last] }
  last
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501

