def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  temp_arr1 = arr1.clone
  temp_arr2 = arr2.clone
  results = []
  arr1.size.times do
    results << temp_arr1.shift << temp_arr2.shift
  end
  results
end

# given solution
def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |elem, idx|
    result << elem << arr2[idx]
  end
  result
end

def interleave(arr1, arr2)
  idx = 0
  arr1.each_with_object([]) do |elem, result|
    result << elem << arr2[idx]
    idx += 1
  end
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']