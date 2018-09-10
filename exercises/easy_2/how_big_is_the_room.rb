def print_area(length, width)
  area_sf = length * width * 10.7639
  puts "The area of the room is #{length * width} square meters (#{area_sf} square feet)."
end

puts "=> Enter the length of the room in meters:"
length = gets.to_f

puts "=> Enter the width of the room in meters:"
width = gets.to_f

print_area(length, width)

# Further Exploration
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03

puts '=> Enter the length of the room in feet: '
length = gets.to_f

puts '=> Enter the width of the room in feet: '
width = gets.to_f

square_feet = (length * width).round(2)
square_inches = (square_feet * SQFEET_TO_SQINCHES).round(2)
square_centimeters = (square_feet * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{square_feet} " + \
     "square feet (#{square_inches} square inches, " + \
     "#{square_centimeters} square centimeters)."