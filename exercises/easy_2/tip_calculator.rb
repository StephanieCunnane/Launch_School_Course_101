# Input: 2 numbers as strings (a bill and a tip percentage) provided by the user
# Output: 2 strings, one displaying the tip and one displaying the total

puts "=> What is the bill?"
bill = gets.to_i

puts "=> What is the tip percentage? (ex: 15 for 15%)"
tip_percentage = gets.to_i

tip_amount = bill * tip_percentage / 100

puts "The tip is $#{tip_amount}."
puts "The total is $#{bill + tip_amount}."

# Further Exploration
puts "=> What is the bill?"
bill = gets.to_i

puts "=> What is the tip percentage? (ex: 15 for 15%)"
tip_percentage = gets.to_i

tip_amount = bill * tip_percentage / 100

puts "The tip is $#{format('%02.2f', tip_amount)}."
puts "The total is $#{format('%02.2f', (bill + tip_amount))}."