def penultimate(str)
  str.split(" ")[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Edge cases covered:
# 1. empty string -> return an empty string
# 2. a string of whitespace -> return an empty string
# 3. one-word string -> return the single word
# 4. an even number of words -> return a string with both words, joined by a comma

def middle_word(str)
  return '' if str.split.empty?

  arr = str.split(' ')
  midpoint = arr.size / 2
  arr.size.odd? ? arr[midpoint] : "#{arr[midpoint - 1]}, #{arr[midpoint]}"
end

p middle_word('This is it.') == 'is'
p middle_word('') == ''
p middle_word('   ') == ''
p middle_word('42') == '42'
p middle_word('two words') == 'two, words'
p middle_word('To infinity and beyond') == 'infinity, and'