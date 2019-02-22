DIGITS = {
   '0' => 0,
   '1' => 1,
   '2' => 2,
   '3' => 3,
   '4' => 4,
   '5' => 5,
   '6' => 6,
   '7' => 7,
   '8' => 8,
   '9' => 9
}

def string_to_integer(num_str)
  sum = 0
  num_arr = num_str.chars
  until num_arr.empty?
    current_num = DIGITS[num_arr.shift]
    sum += current_num * (10**num_arr.size)
  end
  sum
end

# Or
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(digit_str)
  results = []
  place_value_multiplier = 1

  digits = digit_str.chars.map { |char| DIGITS.index(char) }

  digits.reverse_each do |digit|
    results.unshift(digit * place_value_multiplier)
    place_value_multiplier *= 10
  end

  results.sum
end

p string_to_integer('400') == 400
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Given solution:
# 1) Create a data structure mapping digit strings to their corresponding numeric values, a constant
# 2) Using that constant data structure as the decoder, decode our specific digit_str using map
# 3) Initialize and return numeric_value, initially set to 0
# 4) We're going to iterate through our digits array with #each to build up numeric_value:
#         #each will give us digit as a block parameter
#         reassign numeric_value to 10 * numeric_value + digit

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(digit_str)
  digits = digit_str.chars.map { |char| DIGITS.index(char) }

  numeric_value = 0
  digits.each { |digit| numeric_value = 10 * numeric_value + digit }
  numeric_value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# What changes when we switch from decimal to hexadecimal?
#  1) DIGITS constant has 16 elements, not 10
#  2) name of the method and the test cases
#  3) need to downcase the digit_str
#  4) the multiplier changes from 10 to 16

DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def hexadecimal_to_integer(digit_str)
  digits = digit_str.downcase.chars.map { |char| DIGITS.index(char) }

  numeric_value = 0
  digits.each { |digit| numeric_value = 16 * numeric_value + digit }
  numeric_value
end

p hexadecimal_to_integer('4D9f') == 19871

DIGITS = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'a' => 10,
    'b' => 11,
    'c' => 12,
    'd' => 13,
    'e' => 14,
    'f' => 15
}

def hexadecimal_to_integer(num_str)
  sum = 0
  digit_arr = num_str.downcase.chars.map { |char| DIGITS[char] }

  until digit_arr.empty?
    current_num = digit_arr.shift
    sum += current_num * (16**digit_arr.size)
  end
  sum
end

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('4') == 4
p hexadecimal_to_integer('39A') == 922
