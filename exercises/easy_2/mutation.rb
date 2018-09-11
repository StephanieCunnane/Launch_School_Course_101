array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Output
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

# Explanation: array1 and array2 are different enclosing Array objects, but
# the two arrays share their elements. (array1 and array2 have different object_ids,
# but each pair of corresponding elements will share the same object_id.)
# Therefore when a destructive method is called on an element via either variable
# name, the corresponding element in the other array is affected as well, since
# both elements point to the same object in memory.
