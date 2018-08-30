############################################################
# 1)

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# => 1
# => 2
# => 2
# => 3

############################################################
# 2)

# Describe the difference between ! and ? in Ruby.

# ! and ? can be added to the end of Ruby method names. '!' indicates that a method is
# destructive; '?' indicates a predicate method (return value will be a boolean).
# '!' and '?' are method-naming conventions, not actual parts of the Ruby syntax.

# And explain what would happen in the following scenarios:

# 1) what is != and where should you use it?
     # the opposite of ==; an operator that tests for inequality

# 2) put ! before something, like !user_name
     # read as "not"; unary operator that returns the opposite of its argument's
     # truthiness. !user_name would evaluate to true if user_name is nil or false

# 3) put ! after something, like words.uniq!
     # method-naming convention (but not guarantee) to indicate that the method
     # will be destructive with respect to the caller

# 4) put ? before something
     # ? comes after the condition in a ternary expression; read as "if"

# 5) put ? after something
     # method-naming convention (but not guarantee) to indicate that the method
     # is a predicate method (returns a boolean)

# 6) put !! before something, like !!user_name
     # unary operator to force its argument into a boolean context
     # (to turn something into its boolean equivalent)

############################################################
# 3)

# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub('important', 'urgent')
# or (depending if we want a destructive replacement)
advice.sub!('important', 'urgent')

############################################################
# 5)

# Programmatically determine if 42 lies between 10 and 100.

42.between?(10, 100)
# or
(10..100).include?(42)
# or
(10..100).cover?(42)

############################################################
# 6)

# Starting with the string:

famous_words = "seven years ago..."

# show different ways to put the expected "Four score and " in front of it.
"Four score and " << famous_words
# or
"Four score and #{famous_words}"
# or
"Four score and " + famous_words
# or
"Four score and ".concat(famous_words)
# or
# destructive method
famous_words.prepend("Four score and ")

############################################################
# 7)

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# => add_eight(add_eight(add_eight(add_eight(add_eight(number)))))

eval(how_deep)
# => 42

############################################################
# 8)

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# Make this into an un-nested array.
flintstones.flatten!

############################################################
# 9)

# Turn this into an array containing only two elements: Barney's name
# and Barney's number

flintstones = {
  "Fred" => 0,
  "Wilma" => 1,
  "Barney" => 2,
  "Betty" => 3,
  "BamBam" => 4,
  "Pebbles" => 5
}

flintstones.select { |k, _| k == "Barney" }.to_a.flatten
# or
flintstones.assoc("Barney")
