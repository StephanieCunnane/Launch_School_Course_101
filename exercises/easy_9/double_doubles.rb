def double_number?(num)
  num_str = num.to_s
  midpoint = num_str.size / 2
  num_str[0...midpoint] == num_str[midpoint..]
end

def twice(num)
  double_number?(num) ? num : num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10

