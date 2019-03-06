def sum_of_sums(arr)
  sums = []
  arr.each_index { |idx| sums << arr[0..idx].sum }
  sums.sum
end

def sum_of_sums(arr)
  sums = []
  arr.size.times do |idx|
    sums << arr[0..idx].sum
  end
  sums.sum
end

def sum_of_sums(arr)
  sum_total = 0
  1.upto(arr.size) do |length|
    sum_total += arr.slice(0, length).sum
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

