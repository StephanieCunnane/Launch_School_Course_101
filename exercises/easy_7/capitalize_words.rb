def word_cap(str)
  result = []
  str.split.each { |word| result << word.capitalize }
  result.join(' ')
end

def word_cap(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

def word_cap(str)
  str.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

def word_cap(str)
  str.split.map do |word|
    word[0].gsub(/[a-z]/, &:upcase) + word[1..-1].gsub(/[A-Z]/, &:downcase)
  end.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'