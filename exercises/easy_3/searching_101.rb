# Input:  6 numbers as strings provided by the user
# Output: a string displaying whether or not the 6th number appears
#         amongst the first 5 numbers

numbers = []

puts "==> Enter the 1st number:"
numbers << gets.to_i

puts "==> Enter the 2nd number:"
numbers << gets.to_i

puts "==> Enter the 3rd number:"
numbers << gets.to_i

puts "==> Enter the 4th number:"
numbers << gets.to_i

puts "==> Enter the 5th number:"
numbers << gets.to_i

puts "==> Enter the last number:"
last_num = gets.to_i

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}."
else
  puts "The number #{last_num} does not appear in #{numbers}."
end
