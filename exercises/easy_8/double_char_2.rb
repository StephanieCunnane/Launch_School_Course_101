CONSONANTS = ('a'..'z').to_a.join.delete('aeiou')

def double_consonants(str)
  results = ''
  str.each_char do |char|
    results << char
    results << char if CONSONANTS.include?(char.downcase)
  end
  results
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""

