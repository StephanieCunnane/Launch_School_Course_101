# Input: a positive integer
# Output: a string of alternating '1's and '0's (starting with '1') of the
# length of the given integer

def stringy(length)
  result = ''
  length.times { |num| result << (num.even? ? '1' : '0') }
  result
end

# test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Further Exploration

def stringy(length, start=1)
  result = ''
  if start == 0
    length.times { |num| result << (num.odd? ? '1' : '0') }
  else
    length.times { |num| result << (num.even? ? '1' : '0') }
  end
  result
end

# test cases
puts stringy(6) == '101010'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'