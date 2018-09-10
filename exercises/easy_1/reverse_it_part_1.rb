# Input: string
# Output: a new string with the words of the given string in reverse order

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

# test cases
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'