# Input:  2 numbers as strings (a current age and a target retirement age)
#         provided by the user
# Output: 2 strings, one displaying the current year and retirement year and
#         one displaying the number of years until the retirement year

print '=> What is your age? '
current_age = gets.to_i

print '=> At what age would you like to retire? '
retirement_age = gets.to_i

years_to_retirement = retirement_age - current_age
current_year = Time.now.year
retirement_year = current_year + years_to_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_to_retirement} years of work to go!"
