# Input: one positive integer (a salary) and a boolean
# Output: if the boolean is true, the output is the given integer * 0.5
#         if the boolean is false, the output is 0

def calculate_bonus(salary, bonus)
  bonus ? salary * 0.5 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000