# Input: one string provided by the user
# Output: a string greeting

print 'What is your name? '
name = gets.chomp

if name.end_with?('!')
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end
