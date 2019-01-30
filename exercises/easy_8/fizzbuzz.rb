def fizzbuzz(start, stop)
  results = []
  (start..stop).each do |num|
    results <<  if num % 15 == 0
                  "FizzBuzz"
                elsif num % 5 == 0
                  "Buzz"
                elsif num % 3 == 0
                  "Fizz"
                else
                  num
                end
  end
  puts results.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

