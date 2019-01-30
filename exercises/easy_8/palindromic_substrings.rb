def substrings_at_start(str)
  substrings = []
  str.size.times { |idx| substrings << str[0..idx] }
  substrings
end

def substrings(str)
  str = str.dup
  all_substrings = []
  
  str.size.times do
    all_substrings << substrings_at_start(str)
    str = str[1..]
  end
  
  all_substrings.flatten
end

def palindromes(str)
  substrings(str).select { |substr| substr == substr.reverse && substr.size > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

