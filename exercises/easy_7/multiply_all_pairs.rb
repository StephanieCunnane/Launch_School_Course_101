def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |arr1_num|
    arr2.each { |arr2_num| result << arr1_num * arr2_num }
  end
  result.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.each_with_object([]) do |arr1_num, result|
    arr2.each { |arr2_num| result << arr1_num * arr2_num }
  end.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |pair| pair.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]