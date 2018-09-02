############################################################
# 1)

# What do you expect to happen when the greeting variable is referenced in
# the last line of the code below?
if false
  greeting = “hello world”
end

greeting
# => nil (because Ruby is still aware of local variables initialized in
#         an if statement even if they aren't executed)

############################################################
# 2)

greetings = { a: 'hi'}
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting
# => 'hi there'
puts greetings
# => { a: 'hi there'}

############################################################
# 3)

# A) ##############################
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = 'one'
two = 'two'
three = 'three'

mess_with_vars(one, two, three)

puts "one is #{one}"
# => "one is one"
puts "two is #{two}"
# => "two is two"
puts "three is #{three}"
# => "three is three"

# B) ##############################
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is #{one}"
# => "one is one"
puts "two is #{two}"
# => "two is two"
puts "three is #{three}"
# => "three is three"

# C) ##############################
def mess_with_vars(one, two, three)
  one.gsub!('one', 'two')
  two.gsub!('two', 'three')
  three.gsub!('three', 'one')
end


one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is #{one}"
# => "one is two"
puts "two is #{two}"
# => "two is three"
puts "three is #{three}"
# => "three is one"

############################################################
# 4)

# Refactored method
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.length == 4
  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end