def sum_of_sums(arr)
  sums = []
  arr.each_with_index { |num, idx| sums << arr[0..idx].sum }
  sums.sum
end

puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35

