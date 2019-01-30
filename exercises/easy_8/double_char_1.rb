def repeater(str)
  results = ''
  str.each_char { |char| results << char << char }
  results
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''

