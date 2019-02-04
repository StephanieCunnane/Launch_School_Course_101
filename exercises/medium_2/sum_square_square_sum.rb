def square_of_sum(num)
  (1..num).sum**2
end

def sum_of_squares(num)
  (1..num).map { |num| num**2 }.sum
end

def sum_square_difference(num)
  square_of_sum(num) - sum_of_squares(num)
end

# Given solution
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0
  
  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end
  
  sum**2 - sum_of_squares
end

puts sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150

