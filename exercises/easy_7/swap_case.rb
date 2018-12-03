def swapcase(str)
  str.each_char.with_index do |char, idx|
    if /[a-z]/i.match?(char)
      str[idx] = char.ord >= 97 ? char.upcase : char.downcase
    end
  end
  str
end

def swapcase(str)
  str.gsub(/[a-z]/i) do |char|
    char == char.downcase ? char.upcase : char.downcase
  end
end

def swapcase(str)
  str.chars.map { |char| char == char.downcase ? char.upcase : char.downcase }.join
end

# given solution
def swapcase(str)
  characters = str.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'