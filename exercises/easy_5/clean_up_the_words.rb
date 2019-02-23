def cleanup(str)
  alphabetic_chars = ('a'..'z').to_a << ' '
  alphabetic_results = []
  str.each_char do |char|
    alphabetic_results << (alphabetic_chars.include?(char) ? char : ' ')
  end

  no_duplicate_spaces = []
  no_duplicate_spaces << ' ' if alphabetic_results[0] == ' '
  previous_char = ' '
  alphabetic_results.each do |char|
    next if char == ' ' && previous_char == ' '
    previous_char = char
    no_duplicate_spaces << char
  end
  no_duplicate_spaces.join
end

def cleanup(str)
  str.chars.map { |char| char.match(/[a-z]/i) ? char : ' ' }.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---") == ' '
p cleanup("---a") == ' a'
p cleanup("6*($") == ' '

# given solution
def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

# or
def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').gsub(/\s+/, ' ')
end

# or
LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

def cleanup(phrase)
  alphabetic_phrase = ''
  phrase.each_char do |char|
    alphabetic_phrase << (LETTERS.include?(char) ? char : ' ')
  end
  alphabetic_phrase.squeeze(' ')
end
