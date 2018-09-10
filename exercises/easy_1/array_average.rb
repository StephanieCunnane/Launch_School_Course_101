# Input: one non-empty array of positive integers
# Output: one number (the average of the integers in the given array)

def average(nums_to_average)
  nums_to_average.sum / nums_to_average.length
end

# test cases
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further Exploration

def average(nums_to_average)
  nums_to_average.sum.fdiv(nums_to_average.length)
end
