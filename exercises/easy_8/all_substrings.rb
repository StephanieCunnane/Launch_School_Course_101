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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Given solution
def substrings(str)
  results = []
  (0...str.size).each do |start_idx|
    this_substr = str[start_idx..-1]
    results.concat(substrings_at_start(this_substr))
  end
  results
end

