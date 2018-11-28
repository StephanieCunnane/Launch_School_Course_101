def reverse!(arr)
  half_length = arr.size / 2
  left_idx = 0
  right_idx = -1
  half_length.times do
    arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
    left_idx += 1
    right_idx -= 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []