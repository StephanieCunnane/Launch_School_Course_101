def rotate_array(arr)
  arr[1..] + [arr[0]]
end

# use Array#[]=
def rotate_rightmost_digits(int, n)
  all_digits = int.digits.reverse
  all_digits[-n..] = rotate_array(all_digits[-n..])
  all_digits.join.to_i
end

# Or
def rotate_array(arr)
  arr[1..] << arr[0]
end

def rotate_rightmost_digits(target_num, n)
  int_arr = target_num.digits.reverse
  reversed_digits = rotate_array(int_arr.slice!(-n..))
  (int_arr + reversed_digits).join.to_i
end

# Given solution
def rotate_rightmost_digits(target_num, n)
  all_digits = target_num.to_s.chars
  all_digits[-n..] = rotate_array(all_digits[-n..])
  all_digits.join.to_i
end


puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

