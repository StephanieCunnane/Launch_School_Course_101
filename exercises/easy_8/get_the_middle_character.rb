def center_of(str)
  results = str.chars
  until results.size <= 2
    results.shift
    results.pop
  end
  results.join
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'

