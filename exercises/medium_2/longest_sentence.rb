text = File.read('frankenstein.txt')
sentences = text.split(/\.|\?|!/)

longest_sentence = sentences.max_by { |sentence| sentence.split.size }
longest_sentence = longest_sentence.strip
number_of_words = longest_sentence.split.size

puts "Longest sentence: #{longest_sentence}"
puts "The longest sentence contains #{number_of_words} words."

