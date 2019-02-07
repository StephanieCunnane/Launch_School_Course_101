# What is the strange behavior? 
# Example: guessed 5 => too big, then guessed 4 => too small, then guessed 5 => Yes! You win.
# 2 problems with this code:
#   1) Even when we guess the correct number, we don't break out of the loop until we enter the winning_number max_attempts times
#   2) Recursion isn't needed here - we just need to stay inside the original loop until the user either guesses the correct number or reaches max_attempts. 

# As originally written, guess_number is a recursive method with no base case -> we've created an infinite loop

#def valid_integer?(string)
#  string.to_i.to_s == string
#end
#
#def guess_number(max_number, max_attempts)
#  winning_number = (1..max_number).to_a.sample
#  attempts = 0
#  
#  puts "Winning number is #{winning_number}"
#
#  loop do
#    attempts += 1
#    break if attempts > max_attempts
#    
#    puts "attempt #{attempts} of #{max_attempts}"
#
#    input = nil
#    until valid_integer?(input)
#      print 'Make a guess: '
#      input = gets.chomp
#    end
#
#    guess = input.to_i
#
#    if guess == winning_number
#      puts 'Yes! You win.'
#      #break
#    else
#      puts 'Nope. Too small.' if guess < winning_number
#      puts 'Nope. Too big.'   if guess > winning_number
#
#      # Try again:
#      guess_number(max_number, max_attempts)
#    end
#  end
#end

#guess_number(10, 3)

# Corrected code
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0
  
  loop do
    attempts += 1
    break if attempts > max_attempts
    
    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end
    
    guess = input.to_i
    
    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)

