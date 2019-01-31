def rotate_array(arr)
  arr[1..] + [arr[0]]
end

def rotate_rightmost_digits(int, n_digits)
  int_arr = int.digits.reverse
  first = int_arr - int_arr.last(n_digits)
  last = int_arr - first
  
  (first + rotate_array(last)).join.to_i
end

# refactor to use Array#[]=
def rotate_rightmost_digits(int, n)
  all_digits = int.digits.reverse
  all_digits[-n..] = rotate_array(all_digits[-n..])
  all_digits.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

