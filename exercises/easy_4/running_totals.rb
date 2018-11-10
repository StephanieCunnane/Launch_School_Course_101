def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end

# or

def running_total(arr)
  sum = 0
  arr.each_with_object([]) { |num, new_arr| new_arr << sum += num }
end

# or

def running_total(arr)
  new_arr = []
  arr.size.times { |idx| new_arr << arr.slice(0..idx).reduce(:+) }
  new_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []