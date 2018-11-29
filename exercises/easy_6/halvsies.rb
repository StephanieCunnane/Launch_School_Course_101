def halvsies(arr)
  temp = arr.clone
  sub_arr1 = []
  sub_arr2 = []
  repetitions = arr.size / 2

  repetitions.times do
    sub_arr1 << temp.shift
    sub_arr2.unshift(temp.pop)
  end

  sub_arr1 << temp[0] unless temp.empty?

  [sub_arr1, sub_arr2]
end

# given solution
def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]