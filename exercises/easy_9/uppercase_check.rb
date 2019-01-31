def uppercase?(str)
  str.each_char { |char| return false if char =~ /[a-z]/ }
  true
end
  
puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

