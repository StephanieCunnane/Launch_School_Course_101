def balanced?(str)
  paren_counter = 0
  str.each_char do |char|
    paren_counter += 1 if char == '(' 
    paren_counter -= 1 if char == ')'
    return false if paren_counter < 0
  end
  paren_counter == 0
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

