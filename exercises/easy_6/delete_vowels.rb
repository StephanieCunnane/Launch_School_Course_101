def remove_vowels(arr)
  results = []
  arr.each do |word|
    results << word.delete('aeiouAEIOU')
  end
  results
end

# or
def remove_vowels(words_arr)
  words_arr.map { |word| word.delete('aeiouAEIOU') }
end

# or
def remove_vowels(words_arr)
  words_arr.map { |word| word.gsub(/[aeiou]/i, '')}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']