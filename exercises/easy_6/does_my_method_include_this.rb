def include?(arr, target_value)
  arr.each { |elem| return true if elem == target_value }
  false
end

def include?(arr, target_value)
  arr.count(target_value) >= 1
end

def include?(arr, target_value)
  hsh = Hash.new(false)
  arr.each { |elem| hsh[elem] = true }
  hsh[target_value]
end

def include?(arr, target_value)
  (arr - [target_value]).size < arr.size
end

# given solution
def include?(arr, target_value)
  !!arr.find_index(target_value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false