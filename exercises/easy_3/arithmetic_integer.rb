# Input:  2 numbers as strings provided by the user
# Output: 6 strings displaying the results of 6 different operations

def prompt(msg)
  puts "==> #{msg}"
end

num1 = nil
loop do
  prompt("Enter the first number:")
  num1 = gets.to_i
  break if num1 > 0
  prompt("Please enter an integer greater than 0.")
end

num2 = nil
loop do
  prompt("Enter the second number:")
  num2 = gets.to_i
  break if num2 > 0
  prompt("Please enter an integer greater than 0.")
end

prompt("#{num1} + #{num2} = #{num1 + num2}")
prompt("#{num1} - #{num2} = #{num1 - num2}")
prompt("#{num1} * #{num2} = #{num1 * num2}")
prompt("#{num1} / #{num2} = #{num1 / num2}")
prompt("#{num1} % #{num2} = #{num1 % num2}")
prompt("#{num1} ** #{num2} = #{num1**num2}")
