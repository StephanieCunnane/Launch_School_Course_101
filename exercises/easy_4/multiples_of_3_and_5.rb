def multisum(num)
  sum = 0
  (1..num).each do |n|
    sum += n if n % 3 == 0 || n % 5 == 0
  end
  sum
end

# or

def multisum(num)
  multiples = (1..num).to_a.select { |n| n % 3 == 0 || n % 5 == 0 }
  multiples.reduce(:+)
end

# or

def multisum(limit)
  results = []
  (1..limit).each do |int|
    results << int if int % 3 == 0 || int % 5 == 0
  end
  results.sum
end

# or

def multisum(limit)
  (1..limit).reduce(0) do |sum, int|
    sum += int if int % 3 == 0 || int % 5 == 0
    sum
  end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

