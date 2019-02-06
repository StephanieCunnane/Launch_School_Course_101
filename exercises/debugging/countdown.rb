# Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

# As originally written, this code decrements the counter within the decrease method. But that doesn't affect the outer scope local variable counter. To fix this, within the Integer#times block, we can reassign the value of counter to the return value of calling decrease.

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

