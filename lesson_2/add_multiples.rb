def add_multiples(target, arr_of_factors=[3, 5])
  arr_of_factors = [3, 5] if arr_of_factors.empty?
  multiples = []

  (1..target - 1).each do |num|
    arr_of_factors.each do |factor|
      multiples << num if num % factor == 0
    end
  end

  multiples.uniq.sum
end

puts add_multiples(20, [3, 5]) # => 78
puts add_multiples(20, [5]) # => 30
puts add_multiples(20, [3]) # => 63
puts add_multiples(20, [19]) # => 19
puts add_multiples(20, []) # => 78
puts add_multiples(20) # => 78
puts add_multiples(1, []) # => 0
