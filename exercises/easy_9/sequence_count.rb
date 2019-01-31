def sequence(arr_size, base_num)
  results = []
  1.upto(arr_size) { |count| results << count * base_num }
  results
end

def sequence(count, multiplier)
  results = []
  1.upto(count) { |idx| results << idx * multiplier }
  results
end

# Using #map saves me from having to create/return a results arr and from having to push to the results arr on each iteration. Map creates, populates and returns that results arr for me, without me explicitly using an extra data structure

def sequence(count, multiplier)
  1.upto(count).map { |idx| idx * multiplier }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

