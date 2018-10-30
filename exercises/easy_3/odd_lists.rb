def oddities(arr)
  result = []
  arr.each_with_index { |num, index| result << num if index.even? }
  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def oddities_alt1(arr)
  result = []
  arr.size.times { |index| result << arr[index] if index.even? }
  result
end

p oddities_alt1([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_alt1([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities_alt1(['abc', 'def']) == ['abc']
p oddities_alt1([123]) == [123]
p oddities_alt1([]) == []

def oddities_alt2(arr)
  count = 0
  arr.each_with_object([]) do |num, result|
    result << num if count.even?
    count += 1
  end
end

p oddities_alt2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_alt2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities_alt2(['abc', 'def']) == ['abc']
p oddities_alt2([123]) == [123]
p oddities_alt2([]) == []

def evens(arr)
  result = []
  arr.each_with_index { |num, index| result << num if index.odd? }
  result
end

p evens([2, 3, 4, 5, 6]) == [3, 5]
p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens(['abc', 'def']) == ['def']
p evens([123]) == []
p evens([]) == []