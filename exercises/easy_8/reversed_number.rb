def reversed_number(int)
  int.to_s.reverse.to_i
end

# different mental model: join the array that Integer#digits returns

def reversed_number(int)
  int.digits.join.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

