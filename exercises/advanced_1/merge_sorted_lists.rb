def merge (arr1, arr2)
  results = []
  combined_arr_size = arr1.size + arr2.size
  until results.size == combined_arr_size
    if arr1.empty? || arr2.empty?
      arr1.empty? ? arr2.each { |elem| results << elem } : arr1.each { |elem| results << elem }
      break
    end
    lower = [arr1[0], arr2[0]].min
    results << lower
    arr1[0] == lower ? arr1 = arr1[1...] : arr2 = arr2[1..]
  end 
 
  results
end

# Given solution
def merge(arr1, arr2)
  arr2_idx = 0
  result = []
  
  arr1.each do |value|
    while arr2_idx < arr2.size && arr2[arr2_idx] <= value
      result << arr2[arr2_idx]
      arr2_idx += 1
    end
    result << value
  end
  
  result.concat(arr2[arr2_idx..])
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

