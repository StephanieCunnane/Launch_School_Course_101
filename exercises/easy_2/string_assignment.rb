name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# Output
BOB
BOB

# Explanation: name and save_name both point to the same object in memory.
# So when a destructive method is called on that object via one variable name,
# the other variable name is affected as well.