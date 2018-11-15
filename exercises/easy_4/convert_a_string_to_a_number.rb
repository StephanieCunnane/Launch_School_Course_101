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

p string_to_integer('400') == 400
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

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