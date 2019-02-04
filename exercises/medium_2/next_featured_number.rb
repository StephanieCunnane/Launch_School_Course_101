def featured(starting_int)
  return "No possible number" if starting_int.to_s.size > 9
  
  num = starting_int + 1
  loop do
    if (num.odd?) && (num % 7 == 0) && (num.digits == num.digits.uniq)
      return num
    end
    num += 1
  end
end

# Given solution
def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0
    
  loop do
    num_chars = num.to_s.chars
    return num if num_chars.uniq == num_chars
    num += 14
    break if num >= 9_876_543_210
  end
    
  'There is no possible number that fulfills those requirements.'
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

