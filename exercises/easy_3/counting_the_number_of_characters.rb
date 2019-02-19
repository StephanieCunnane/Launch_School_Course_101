# Input:  one string provided by the user
# Output: one string displaying the number of characters in the input string
#         (whitespace excluded)

print 'Please write word or multiple words: '
input_string = gets.chomp
char_count = input_string.delete(' ').length

puts "There are #{char_count} characters in \"#{input_string}\"."

# Or
print "Please write word or multiple words: "
phrase = gets.chomp
char_count = phrase.count('^ ')

puts %(There are #{char_count} characters in "#{phrase}".)
