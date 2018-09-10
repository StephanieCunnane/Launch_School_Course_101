# Input: none
# Output: a string stating a random age between 20 and 200

def print_teddys_age()
  puts "Teddy is #{rand(20..200)} years old!"
end

print_teddys_age()

# Further Exploration
def print_age(name)
  name = 'Teddy' if name.length == 0
  puts "#{name} is #{rand(20..200)} years old!"
end

puts "Please enter a name."
name = gets.chomp.capitalize

print_age(name)