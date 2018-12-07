def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair.first * pair.last }
end

# given solution
def multiply_list(arr1, arr2)
  products = []
  arr1.each_with_index do |num, idx|
    products << num * arr2[idx]
  end
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]