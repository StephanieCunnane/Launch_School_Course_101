# Originally the code was entirely missing an elsif condition.
# This caused array.map { |value| value * value } to be the condition, with no
# operation to carry out for the truthy elsif branch -> every non-empty array
# passed to this method would evaluate to nil.

def my_method(array)
  if array.empty?
    []
  elsif array.size >= 2
    array.map { |value| value * value }
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

