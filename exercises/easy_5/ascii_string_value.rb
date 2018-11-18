# Understand the problem - input/output, requirements, rules, mental model
# input - one string
# output - one integer
# requirements - write a method that converts a given string into an integer that indicates the sum of the ASCII values for every character in the given string
# rules - use String#ord to determine the ASCII value
# mental model - a running total sum; iterate through the given string, adding the ASCII value to the sum on each iteration; return the sum

def ascii_value(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0