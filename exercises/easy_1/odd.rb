# Input: an integer (positive, negative or 0)
# Output: boolean (true if the given integer is odd)

def is_odd?(num)
  num % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Further Exploration
def is_odd?(num)
  num.remainder(2) != 0
end