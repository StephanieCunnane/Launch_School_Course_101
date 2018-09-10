# Input: string
# Output: a new string with all the words of 5+ letters from the given string
# in reverse order

def reverse_words(phrase)
  result = []
  phrase.split.each do |word|
    result << (word.length >= 5 ? word.reverse : word)
  end
  result.join(' ')
end

# test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS