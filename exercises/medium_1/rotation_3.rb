def rotate_array(arr)
  arr[1..] + [arr[0]]
end

def rotate_rightmost_digits(int, n)
  all_digits = int.digits.reverse
  all_digits[-n..] = rotate_array(all_digits[-n..])
  all_digits.join.to_i
end

def max_rotation(int)
  int.digits.size.downto(2) do |count|
    int = rotate_rightmost_digits(int, count)
  end
  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

