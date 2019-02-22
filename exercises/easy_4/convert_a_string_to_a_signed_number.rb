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

# def string_to_signed_integer(num_str)
#   case num_str[0]
#   when '-' then string_to_integer(num_str[1..-1]) * -1
#   when '+' then string_to_integer(num_str[1..-1])
#   else string_to_integer(num_str)
#   end
# end

# or

def string_to_signed_integer(num_str)
  multiplier = num_str[0] == '-' ? -1 : 1
  unsigned_num_str = num_str.start_with?('-', '+') ? num_str[1..-1] : num_str
  string_to_integer(unsigned_num_str) * multiplier
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(digit_str)
  digits = digit_str.chars.map { |char| DIGITS.index(char) }

  numeric_value = 0
  digits.each { |digit| numeric_value = 10 * numeric_value + digit }
  numeric_value
end

def string_to_signed_integer(digit_str)
  negative = digit_str[0] == '-'
  digit_str = digit_str.sub(/[+-]/, '')
  int = string_to_integer(digit_str)
  negative ? -int : int
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
