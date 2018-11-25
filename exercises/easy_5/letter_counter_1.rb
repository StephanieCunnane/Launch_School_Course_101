def word_sizes(str)
  word_length_frequencies = Hash.new(0)
  str.split.each do |word|
    word_length_frequencies[word.size] += 1
  end
  word_length_frequencies
end

# or

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.size] += 1 }
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
