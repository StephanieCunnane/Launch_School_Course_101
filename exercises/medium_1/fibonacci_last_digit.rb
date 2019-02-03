def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [last, first + last] }
  last
end

# Works until input is beyond 1_000_000
def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end

def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [last % 10, (first + last) % 10]}
  last
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4

