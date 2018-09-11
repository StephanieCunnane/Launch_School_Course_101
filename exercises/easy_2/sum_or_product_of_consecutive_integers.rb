# Input:  2 strings provided by the user (an integer greater than 0 and 's'/'p'
#         to indicate the operation)
# Output: a string displaying the sum/product of the integers between 1 and
#         the given integer

num = nil
loop do
  puts '>> Please enter an integer greater than 0:'
  num = gets.to_i
  break if num > 0
  puts '>> Invalid integer.'
end

operation = nil
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if ['s', 'p'].include?(operation)
  puts '>> Invalid operation.'
end

operation_string = operation == 's' ? 'sum' : 'product'

result = operation == 's' ? (1..num).reduce(:+) : (1..num).reduce(:*)

puts "The #{operation_string} of the integers between 1 and #{num} is #{result}."
