# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

# As the method was originally written, we were mutating the collection as we iterated through it.

# Corrected code
def negative?(word)
  ['dull', 'boring', 'annoying', 'chaotic'].include?(word)
end

def neutralize(sentence)
  words = sentence.split
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

