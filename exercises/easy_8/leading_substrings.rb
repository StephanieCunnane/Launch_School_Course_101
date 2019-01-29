def substrings_at_start(str)
  substrings = []
  str.size.times { |idx| substrings << str[0..idx] }
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

