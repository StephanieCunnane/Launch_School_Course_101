# Input: one positive integer
# Output: an integer that is the sum of the digits of the given integer

def sum(num)
  num.digits.sum
end

# Or
def sum(int)
  int.to_s.chars.map(&:to_i).sum
end

# Or
def sum(int)
  temp_arr = []
  loop do
    int, remainder = int.divmod(10)
    temp_arr << remainder
    break if int == 0
  end
  temp_arr.sum
end

# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
