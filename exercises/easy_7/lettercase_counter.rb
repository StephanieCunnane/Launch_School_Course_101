def letter_case_count(str)
  result = Hash[:lowercase, 0, :uppercase, 0, :neither, 0]
  str.each_char do |char|
    case
    when /[a-z]/.match?(char) then result[:lowercase] += 1
    when /[A-Z]/.match?(char) then result[:uppercase] += 1
    else result[:neither] += 1
    end
  end
  result
end

# refactored to:
def letter_case_count(str)
  result = Hash[:lowercase, 0, :uppercase, 0, :neither, 0]
  str.each_char do |char|
    case char
    when /[a-z]/ then result[:lowercase] += 1
    when /[A-Z]/ then result[:uppercase] += 1
    else result[:neither] += 1
    end
  end
  result
end

# given solution
def letter_case_count(str)
  counts = {}
  characters = str.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }