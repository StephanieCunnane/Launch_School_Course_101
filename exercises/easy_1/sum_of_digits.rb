# Input: one positive integer
# Output: an integer that is the sum of the digits of the given integer

def sum(num)
  num.digits.sum
end

# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45