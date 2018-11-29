def reverse(arr)
  temp = arr.clone
  results = []
  results << temp.pop until temp.empty?
  results
end

def reverse(arr)
  arr.each_with_object([]) { |elem, result| result.unshift(elem) }
end

def reverse(arr)
  arr.reduce([]) { |memo_arr, elem| memo_arr.unshift(elem) }
end

# or
def reverse(arr)
  arr.reverse_each.reduce([], :<<)
end

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b c d e)) == %w(e d c b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

list = [1, 2, 3]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 2, 3]
p new_list == [3, 2, 1]

# given solution
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end
