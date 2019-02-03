WORD_TO_DIGIT_STR = {
  'zero' => 0,  
  'one' => 1,  
  'two' => 2,  
  'three' => 3,  
  'four' => 4,  
  'five' => 5,  
  'six' => 6,  
  'seven' => 7,  
  'eight' => 8,  
  'nine' => 9  
}.freeze

def word_to_digit(sentence)
  sentence = sentence.dup
  WORD_TO_DIGIT_STR.keys.each do |word|
    sentence.gsub!(word, WORD_TO_DIGIT_STR)
  end
  sentence
end

sentence = 'Please call me at five five five one two three four. Thanks.'
p word_to_digit(sentence) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p sentence

