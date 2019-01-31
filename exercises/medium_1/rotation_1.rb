def rotate_array(arr)
  arr = arr.dup
  arr << arr.shift
end

# refactor to use slicing and Array#+
def rotate_array(arr)
  arr[1..] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_array(int.digits.reverse).join.to_i
end

word = 'hello'
p rotate_string(word) == 'elloh'
puts word

p rotate_integer(12345) == 23451

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]  
p x == [1, 2, 3, 4]               

