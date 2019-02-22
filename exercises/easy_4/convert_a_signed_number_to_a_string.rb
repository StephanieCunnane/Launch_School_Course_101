INT_TO_NUM_STR = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}

def integer_to_string(int)
  return '0' if int == 0
  num_arr = []
  while int > 0
    num_arr.unshift(INT_TO_NUM_STR[int % 10])
    int /= 10
  end
  num_arr.join
end

def signed_integer_to_string(int)
  return '0' if int == 0
  negative_flag = int < 0
  result = integer_to_string(int.abs)
  result.prepend(negative_flag ? '-' : '+')
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'


# given solution
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when 1 then "+#{integer_to_string(number)}"
  else integer_to_string(number)
  end
end

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(int)
  digits_str = ''
  loop do
    int, remainder = int.divmod(10)
    digits_str.prepend(DIGITS[remainder])
    break if int == 0
  end
  digits_str
end

def signed_integer_to_string(int)
  return '0' if int.zero?
  prefix = int.positive? ? '+' : '-'
  num_str = integer_to_string(int.abs)
  "#{prefix}#{num_str}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
